# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stattleship/version'

Gem::Specification.new do |spec|
  spec.name          = 'stattleship-ruby'
  spec.version       = Stattleship::Ruby::VERSION
  spec.authors       = ['Stattleship', 'Edward Loveall']
  spec.email         = ['support@stattleship.com']

  spec.summary       = 'Stattleship API Ruby client'
  spec.description   = 'Connect to and retrive data from the Stattleship API'
  spec.homepage      = 'http://playbook.stattleship.com'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end