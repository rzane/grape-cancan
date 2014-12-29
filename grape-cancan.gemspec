# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/cancan/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-cancan"
  spec.version       = Grape::CanCan::VERSION
  spec.authors       = ["Ray Zane"]
  spec.email         = ["raymondzane@gmail.com"]
  spec.summary       = %q{Authorize your Grape API with CanCan}
  spec.description   = %q{Authorize your Grape API with CanCan}
  spec.homepage      = "https://github.com/rzane/grape-cancan"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'grape', '>= 0.6.0'
  spec.add_dependency 'cancancan'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
