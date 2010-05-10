# Copyright (c) 2009-2010 Fabio Cevasco
# website: http://www.h3rald.com/glyph
# license: MIT

require 'rubygems'
require 'pathname'
require 'yaml'
require 'gli'
require 'extlib'
require 'treetop'
require 'rake'

# Glyph is a Rapid Document Authoring Framework able to produce structured documents 	effortlessly.
module Glyph

	# The directory containing Glyph library files
	LIB = Pathname(__FILE__).dirname.expand_path/'glyph'

	# The directory containing the full Glyph installation
	HOME = LIB/'../../'

	# The directory containing all Glyph tests
	SPEC_DIR = Pathname(__FILE__).dirname.expand_path/'../spec'

	# The directory containing all Glyph Rake tasks
	TASKS_DIR = Pathname(__FILE__).dirname.expand_path/'../tasks'

	require LIB/'system_extensions'
	require LIB/'config'
	require LIB/'node'
	require LIB/'document'
	require LIB/'glyph_language'
	require LIB/'macro_validators'
	require LIB/'macro'
	require LIB/'interpreter'

	class Error < RuntimeError; end
	class SyntaxError < Error; end
	class MacroError < Error; end
	class MutualInclusionError < MacroError; end

	# The current version of Glyph
	VERSION = file_load(HOME/'VERSION').strip

	# All the currently-loaded snippets
	SNIPPETS = {}

	# All the currently-loaded macros
	MACROS = {}

	begin
		unless const_defined? :MODE then
			# Glyph's modes: debug/lite/test
			MODE = {:debug => false, :lite => false, :test => false, :library => false} 
		end
	rescue
	end

	# The main document being generated by Glyph
	@@document = nil

	(class << self; self; end).instance_eval do
		["test", "lite", "debug", "library"].each do |mode|
			define_method((mode+"?").to_sym) do
				MODE[mode.to_sym]
			end
			define_method((mode+"_mode=")) do |m|
				MODE[mode.to_sym] = m
			end
		end
	end

	# The directory of the current Glyph project.
	PROJECT = (Glyph.test?) ? Glyph::SPEC_DIR/"test_project" : Pathname.new(Dir.pwd)

	# Glyph's configuration
	CONFIG = Glyph::Config.new :resettable => true, :mutable => false

	home_dir = Pathname.new(RUBY_PLATFORM.match(/win32|mingw/) ? ENV['HOMEPATH'] : ENV['HOME'])
	SYSTEM_CONFIG = 
		Glyph::Config.new(:file => HOME/'config.yml')
	GLOBAL_CONFIG = 
		Glyph.test? ? Glyph::Config.new(:file => SPEC_DIR/'.glyphrc') : Glyph::Config.new(:file => home_dir/'.glyphrc')
	PROJECT_CONFIG = 
		Glyph::Config.new(:file => PROJECT/'config.yml', :resettable => true) rescue Glyph::Config.new(:resettable => true, :mutable => true)

	# Loads all Rake tasks
	def self.setup
		FileList["#{TASKS_DIR}/**/*.rake"].each do |f|
			load f
		end	
	end

	# Used to access @@document 
	def self.document
		@@document
	end

	# Used to set @@document 
	def self.document=(document)
		@@document = document
	end

	# Returns the value of a configuration setting
	def self.[](setting)
		Glyph::CONFIG.get(setting)
	end

	# Overrides a configuration setting
	# @param [String, Symbol] setting the configuration setting to change
	# @param value the new value
	def self.[]=(setting, value)
		PROJECT_CONFIG.set setting, value
		self.config_refresh
	end

	# Restores Glyph configuration (keeping all overrides and project settings)
	def self.config_refresh
		CONFIG.merge!(SYSTEM_CONFIG.merge(GLOBAL_CONFIG.merge(PROJECT_CONFIG)))
	end

	# Resets Glyph configuration (removing all overrides and project settings)
	def self.config_reset
		Glyph::CONFIG.reset
		Glyph::PROJECT_CONFIG.reset
		self.config_refresh
	end

	# Returns true if the PROJECT constant is set to a valid Glyph project directory
	def self.project?
		children = ["text", "output", "snippets.yml", "config.yml", "document.glyph"].sort
		actual_children = PROJECT.children.map{|c| c.basename.to_s}.sort 
		(actual_children & children) == children
	end

	# Resets Glyph completely, i.e.:
	# * Re-enables all Glyph Rake tasks
	# * Resets the configuration to system defaults
	# * Clears macros and snippets
	def self.reset
		self.enable_all
		self.config_reset
		MACROS.clear
		SNIPPETS.clear
	end

	# Reenables all Glyph Rake tasks
	def self.enable_all
		Rake::Task.tasks.each {|t| t.reenable }
	end

	# Reenables a Rake task
	# @param [Symbol, String] task the task to enable
	def self.enable(task)
		Rake::Task[task].reenable
	end

	# Reenables and runs a Rake task
	# @param [Symbol, String] task the task to run
	# @param *args the task arguments
	def self.run!(task, *args)
		Rake::Task[task].reenable
		self.run task, *args
	end

	# Runs a Rake task
	# @param [Symbol, String] task the task to run
	# @param *args the task arguments
	def self.run(task, *args)
		Rake::Task[task].invoke *args
	end

	# Defines a new macro
	# @param [Symbol, String] name the name of the macro
	def self.macro(name, &block)
		MACROS[name.to_sym] = block
	end

	# Defines an alias for an existing macro
	# @param [Hash] text the single-key hash defining the alias
	# @example
	# 	{:old_name => :new_name}
	def self.macro_alias(pair)
		name = pair.keys[0].to_sym
		found = MACROS[name]
		if found then
			self.warning "Invalid alias: macro '#{name}' already exists."
			return
		end
		MACROS[name] = MACROS[pair.values[0].to_sym]
	end

	# Compiles a single Glyph file
	# @param [String] src the full or relative path to the source file
	# @param [String] out the full or relative path to the output file
	def self.compile(src, out=nil)
		pwd = Dir.pwd
		Dir.chdir Pathname.new(src).parent.to_s
		begin
			require 'glyph/commands'
			self['system.quiet'] = true
			self.library_mode = true
			GLI.run ["compile", src.to_s, out].compact	
		rescue Exception => e
			raise 
		ensure
			Dir.chdir pwd
			self.library_mode = false
			self.lite_mode = false
			self['system.quiet'] = false
		end
	end

	# Converts a text containing Glyph markup language into the current Glyph output target.
	#
	# *Note* Only 'html' is supported as output target for now. 
	# @param [String] text the text to convert
	# @return [String] the converted text
	# @example
	# 	require 'glyph'
	# 	Glyph.filter "section[header[Test]\nA Test section...]"
	def self.filter(text)
		self.lite_mode = true
		self.enable_all
		result = ""
		begin
			self['system.quiet'] = true
			self.library_mode = true
			self.run 'load:all'
			result = Interpreter.new(text).document.output
		rescue Exception => e
			raise 
		ensure
			self.lite_mode = false
			self.library_mode = false
			self['system.quiet'] = false
		end
		result
	end

	# Prints a message
	# @param [String] message the message to print
	def self.info(message)
		puts "#{message}" unless Glyph['system.quiet']
	end

	# Prints a warning
	# @param [String] message the message to print
	def self.warning(message)
		puts "--> warning: #{message}" unless Glyph['system.quiet']
	end

	# Prints an error
	# @param [String] message the message to print
	def self.error(message)
		puts "==> error: #{message}" unless Glyph['system.quiet']
	end

end

Glyph.setup
