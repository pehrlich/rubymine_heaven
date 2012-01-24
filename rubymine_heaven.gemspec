# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubymine_heaven/version"

Gem::Specification.new do |s|
  s.name        = "rubymine_heaven"
  s.version     = RubymineHeaven::VERSION
  s.authors     = ["Petr Cervinka"]
  s.email       = ["petr@petrcervinka.cz"]
  s.homepage    = ""
  s.summary     = %q{Rails gem for pleasant development with InteliJ RubyMine}
  s.description = %q{This gem connects stack trace on rails error page to rubymine (when you click on stack trace line
in browser, RubyMine will open appropriate file on the line which caused the error. In similar manner it connects links
from footnotes (if present) to RubyMine (https://github.com/josevalim/rails-footnotes). You need some manual work to set
handler for browser links (see README).'}

  s.rubyforge_project = "rubymine_heaven"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.0.0"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
