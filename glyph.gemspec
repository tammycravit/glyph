# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{glyph}
  s.version = ""

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fabio Cevasco"]
  s.date = %q{2010-11-27}
  s.default_executable = %q{glyph}
  s.description = %q{Glyph is a framework for structured document authoring.}
  s.email = %q{h3rald@h3rald.com}
  s.executables = ["glyph"]
  s.extra_rdoc_files = [
    "LICENSE.textile",
    "README.textile"
  ]
  s.files = [
    "AUTHORS.textile",
    "CHANGELOG.textile",
    "LICENSE.textile",
    "README.textile",
    "Rakefile",
    "VERSION",
    "benchmark.rb",
    "bin/glyph",
    "book/config.yml",
    "book/document.glyph",
    "book/images/glyph/commands_tasks.png",
    "book/images/glyph/document_generation.png",
    "book/images/glyph/glyph.eps",
    "book/images/glyph/glyph.png",
    "book/images/glyph/glyph.svg",
    "book/lib/commands/commands.rb",
    "book/lib/layouts/bookindex.glyph",
    "book/lib/layouts/bookpage.glyph",
    "book/lib/layouts/project.glyph",
    "book/lib/macros/reference.rb",
    "book/lib/tasks/tasks.rake",
    "book/resources/document_generation.txt",
    "book/snippets.yml",
    "book/text/acknowledgements.glyph",
    "book/text/changelog.glyph",
    "book/text/compiling/compiling.glyph",
    "book/text/compiling/lite_mode.glyph",
    "book/text/compiling/programmatic_usage.glyph",
    "book/text/config/document.glyph",
    "book/text/config/filters.glyph",
    "book/text/config/options.glyph",
    "book/text/config/output.glyph",
    "book/text/extending/bookmarks_headers.glyph",
    "book/text/extending/command.glyph",
    "book/text/extending/commands_tasks.glyph",
    "book/text/extending/further_reading.glyph",
    "book/text/extending/internals.glyph",
    "book/text/extending/interpreting.glyph",
    "book/text/extending/layouts.glyph",
    "book/text/extending/macro_def.glyph",
    "book/text/extending/output_format.glyph",
    "book/text/extending/params_attrs.glyph",
    "book/text/extending/placeholders.glyph",
    "book/text/extending/task.glyph",
    "book/text/extending/validators.glyph",
    "book/text/getting_started/configuration.glyph",
    "book/text/getting_started/create_project.glyph",
    "book/text/getting_started/structure.glyph",
    "book/text/introduction.glyph",
    "book/text/license.glyph",
    "book/text/macros/macros_block.glyph",
    "book/text/macros/macros_core.glyph",
    "book/text/macros/macros_filters.glyph",
    "book/text/macros/macros_inline.glyph",
    "book/text/macros/macros_structure.glyph",
    "book/text/ref_commands.glyph",
    "book/text/stats/bookmarks.glyph",
    "book/text/stats/links.glyph",
    "book/text/stats/macros.glyph",
    "book/text/stats/snippets.glyph",
    "book/text/stats/stats.glyph",
    "book/text/text_editing/attribute_intro.glyph",
    "book/text/text_editing/code.glyph",
    "book/text/text_editing/conditionals.glyph",
    "book/text/text_editing/esc_quot.glyph",
    "book/text/text_editing/evaluation.glyph",
    "book/text/text_editing/glyph_files.glyph",
    "book/text/text_editing/images.glyph",
    "book/text/text_editing/inclusions.glyph",
    "book/text/text_editing/links.glyph",
    "book/text/text_editing/macro_intro.glyph",
    "book/text/text_editing/raw_html.glyph",
    "book/text/text_editing/section_aliases.glyph",
    "book/text/text_editing/sections.glyph",
    "book/text/text_editing/stylesheets.glyph",
    "book/text/text_editing/topics.glyph",
    "book/text/text_editing/xml_fallback.glyph",
    "book/text/troubleshooting/errors_command.glyph",
    "book/text/troubleshooting/errors_generic.glyph",
    "book/text/troubleshooting/errors_macro.glyph",
    "book/text/troubleshooting/errors_parser.glyph",
    "config.yml",
    "document.glyph",
    "glyph.gemspec",
    "layouts/web/index.glyph",
    "layouts/web/topic.glyph",
    "layouts/web5/index.glyph",
    "layouts/web5/topic.glyph",
    "lib/glyph.rb",
    "lib/glyph/analyzer.rb",
    "lib/glyph/bookmark.rb",
    "lib/glyph/commands.rb",
    "lib/glyph/commands/add.rb",
    "lib/glyph/commands/compile.rb",
    "lib/glyph/commands/config.rb",
    "lib/glyph/commands/init.rb",
    "lib/glyph/commands/outline.rb",
    "lib/glyph/commands/stats.rb",
    "lib/glyph/commands/todo.rb",
    "lib/glyph/config.rb",
    "lib/glyph/document.rb",
    "lib/glyph/interpreter.rb",
    "lib/glyph/macro.rb",
    "lib/glyph/macro_validators.rb",
    "lib/glyph/node.rb",
    "lib/glyph/parser.rb",
    "lib/glyph/reporter.rb",
    "lib/glyph/syntax_node.rb",
    "lib/glyph/system_extensions.rb",
    "lib/glyph/utils.rb",
    "macros/block.rb",
    "macros/core.rb",
    "macros/filters.rb",
    "macros/inline.rb",
    "macros/reps/html.rb",
    "macros/reps/html5.rb",
    "macros/reps/web.rb",
    "macros/reps/web5.rb",
    "macros/structure.rb",
    "macros/xml.rb",
    "spec/.glyphrc",
    "spec/files/article.glyph",
    "spec/files/container.textile",
    "spec/files/custom_command.rb",
    "spec/files/custom_tasks.rake",
    "spec/files/document.glyph",
    "spec/files/document_for_stats.glyph",
    "spec/files/document_with_toc.glyph",
    "spec/files/included.textile",
    "spec/files/ligature.jpg",
    "spec/files/markdown.markdown",
    "spec/files/references.glyph",
    "spec/files/test.sass",
    "spec/files/test.scss",
    "spec/files/web1.glyph",
    "spec/files/web2.glyph",
    "spec/files/web_doc.glyph",
    "spec/lib/analyzer_spec.rb",
    "spec/lib/bookmark_spec.rb",
    "spec/lib/commands_spec.rb",
    "spec/lib/config_spec.rb",
    "spec/lib/document_spec.rb",
    "spec/lib/glyph_spec.rb",
    "spec/lib/interpreter_spec.rb",
    "spec/lib/macro_spec.rb",
    "spec/lib/macro_validators_spec.rb",
    "spec/lib/node_spec.rb",
    "spec/lib/parser_spec.rb",
    "spec/lib/reporter_spec.rb",
    "spec/lib/syntax_node_spec.rb",
    "spec/macros/core_spec.rb",
    "spec/macros/filters_spec.rb",
    "spec/macros/html5_spec.rb",
    "spec/macros/macros_spec.rb",
    "spec/macros/textile_spec.rb",
    "spec/macros/web5_spec.rb",
    "spec/macros/web_spec.rb",
    "spec/macros/xml_spec.rb",
    "spec/spec_helper.rb",
    "spec/tasks/generate_spec.rb",
    "spec/tasks/load_spec.rb",
    "spec/tasks/project_spec.rb",
    "styles/coderay.css",
    "styles/coderay.scss",
    "styles/default.css",
    "styles/default.scss",
    "styles/definitions.scss",
    "styles/generate",
    "styles/pagination.css",
    "styles/pagination.scss",
    "styles/ultraviolet/active4d.css",
    "styles/ultraviolet/all_hallows_eve.css",
    "styles/ultraviolet/amy.css",
    "styles/ultraviolet/blackboard.css",
    "styles/ultraviolet/brilliance_black.css",
    "styles/ultraviolet/brilliance_dull.css",
    "styles/ultraviolet/cobalt.css",
    "styles/ultraviolet/dawn.css",
    "styles/ultraviolet/eiffel.css",
    "styles/ultraviolet/espresso_libre.css",
    "styles/ultraviolet/idle.css",
    "styles/ultraviolet/iplastic.css",
    "styles/ultraviolet/lazy.css",
    "styles/ultraviolet/mac_classic.css",
    "styles/ultraviolet/magicwb_amiga.css",
    "styles/ultraviolet/pastels_on_dark.css",
    "styles/ultraviolet/slush_poppies.css",
    "styles/ultraviolet/spacecadet.css",
    "styles/ultraviolet/sunburst.css",
    "styles/ultraviolet/twilight.css",
    "styles/ultraviolet/zenburnesque.css",
    "tasks/generate.rake",
    "tasks/load.rake",
    "tasks/project.rake"
  ]
  s.homepage = %q{http://www.h3rald.com/glyph/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Glyph -- A Ruby-powered Document Authoring Framework}
  s.test_files = [
    "spec/files/custom_command.rb",
    "spec/lib/analyzer_spec.rb",
    "spec/lib/bookmark_spec.rb",
    "spec/lib/commands_spec.rb",
    "spec/lib/config_spec.rb",
    "spec/lib/document_spec.rb",
    "spec/lib/glyph_spec.rb",
    "spec/lib/interpreter_spec.rb",
    "spec/lib/macro_spec.rb",
    "spec/lib/macro_validators_spec.rb",
    "spec/lib/node_spec.rb",
    "spec/lib/parser_spec.rb",
    "spec/lib/reporter_spec.rb",
    "spec/lib/syntax_node_spec.rb",
    "spec/macros/core_spec.rb",
    "spec/macros/filters_spec.rb",
    "spec/macros/html5_spec.rb",
    "spec/macros/macros_spec.rb",
    "spec/macros/textile_spec.rb",
    "spec/macros/web5_spec.rb",
    "spec/macros/web_spec.rb",
    "spec/macros/xml_spec.rb",
    "spec/spec_helper.rb",
    "spec/tasks/generate_spec.rb",
    "spec/tasks/load_spec.rb",
    "spec/tasks/project_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gli>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.15"])
      s.add_runtime_dependency(%q<rake>, [">= 0.8.7"])
      s.add_development_dependency(%q<rspec>, [">= 2.1.0"])
      s.add_development_dependency(%q<yard>, [">= 0.6.2"])
      s.add_development_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_development_dependency(%q<directory_watcher>, [">= 1.3.2"])
      s.add_development_dependency(%q<haml>, [">= 3.0.24"])
      s.add_development_dependency(%q<RedCloth>, [">= 4.2.3"])
      s.add_development_dependency(%q<bluecloth>, [">= 2.0.9"])
      s.add_development_dependency(%q<coderay>, [">= 0.9.5"])
    else
      s.add_dependency(%q<gli>, [">= 1.1.3"])
      s.add_dependency(%q<extlib>, [">= 0.9.15"])
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<rspec>, [">= 2.1.0"])
      s.add_dependency(%q<yard>, [">= 0.6.2"])
      s.add_dependency(%q<jeweler>, ["= 1.5.1"])
      s.add_dependency(%q<directory_watcher>, [">= 1.3.2"])
      s.add_dependency(%q<haml>, [">= 3.0.24"])
      s.add_dependency(%q<RedCloth>, [">= 4.2.3"])
      s.add_dependency(%q<bluecloth>, [">= 2.0.9"])
      s.add_dependency(%q<coderay>, [">= 0.9.5"])
    end
  else
    s.add_dependency(%q<gli>, [">= 1.1.3"])
    s.add_dependency(%q<extlib>, [">= 0.9.15"])
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<rspec>, [">= 2.1.0"])
    s.add_dependency(%q<yard>, [">= 0.6.2"])
    s.add_dependency(%q<jeweler>, ["= 1.5.1"])
    s.add_dependency(%q<directory_watcher>, [">= 1.3.2"])
    s.add_dependency(%q<haml>, [">= 3.0.24"])
    s.add_dependency(%q<RedCloth>, [">= 4.2.3"])
    s.add_dependency(%q<bluecloth>, [">= 2.0.9"])
    s.add_dependency(%q<coderay>, [">= 0.9.5"])
  end
end

