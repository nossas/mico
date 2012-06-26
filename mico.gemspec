# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mico/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nícolas Iensen", "Luiz Fonseca"]
  gem.email         = ["nicolas@engage.is", "luiz@engage.is"]
  gem.summary       = %q{Wrapper para a API do Meu Rio}
  gem.homepage      = "https://github.com/meurio/mico"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mico"
  gem.require_paths = ["lib"]
  gem.version       = Mico::VERSION

  gem.add_development_dependency("rspec")
  gem.add_development_dependency("httparty")
  gem.add_development_dependency("webmock")
end
