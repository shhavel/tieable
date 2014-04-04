# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tieable/version'

Gem::Specification.new do |spec|
  spec.name          = "tieable"
  spec.version       = Tieable::VERSION
  spec.authors       = ["Alexander Avoyants"]
  spec.email         = ["shhavel@gmail.com"]
  spec.summary       = %q{Provides Object#tie method which acts as public_send if receives some arguments,
except if first argument is nil it returns object itself.}
  spec.description   = %q{Provides Object#tie method which acts as public_send if receives some arguments,
except if first argument is nil it returns object itself.
Method is intended for creating conditional method chains.
Also can be used with block only (no arguments).
In this case method returns result of calling block on self or itself (if block returns nil or false).}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
