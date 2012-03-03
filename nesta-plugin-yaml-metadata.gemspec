# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nesta-plugin-yaml-metadata/version"

Gem::Specification.new do |s|
  s.name        = "nesta-plugin-yaml-metadata"
  s.version     = Nesta::Plugin::Yaml::Metadata::VERSION
  s.authors     = ["Graham Ashton"]
  s.email       = ["graham@effectif.com"]
  s.homepage    = ""
  s.summary     = %q{Replaces Nesta's metadata syntax with Yaml}
  s.description = <<EOF
Pages of content in Nesta CMS can be embellished with metadata, written
in a simple key/value pair syntax. If you'd like extra flexibility in
your metadata, you can use this plugin to replace Nesta's built-in
metadata parser with Ruby's Yaml parser.

You still need to make sure that all the metadata is at the top of the
page; the first blank line signifies the start of the page content.
EOF

  s.rubyforge_project = "nesta-plugin-yaml-metadata"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency("nesta", ">= 0.9.12")
  s.add_development_dependency("rake")
end
