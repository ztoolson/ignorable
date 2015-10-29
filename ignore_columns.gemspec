# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ignore_columns/version'

Gem::Specification.new do |spec|
  spec.name          = "ignore_columns"
  spec.version       = IgnoreColumns::VERSION
  spec.authors       = ["Nathaniel Jones", "Mando Escamilla", "Zach Toolson"]
  spec.email         = ["nj@third.io", "", "zach.toolson@gmail.com"]

  spec.summary       = %q{Ignore columns in ActiveRecord models.}
  spec.description   = %q{Ignore columns in ActiveRecord models.}
  spec.homepage      = "http://github.com/ztoolson/ignore_columns"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activerecord", ">= 3"
end
