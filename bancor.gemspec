
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bancor/version"

Gem::Specification.new do |spec|
  spec.name          = "bancor"
  spec.version       = Bancor::VERSION
  spec.authors       = ["Yuta Kurotaki"]
  spec.email         = ["yuta.kurotaki@gmail.com"]

  spec.summary       = %q{Implement the logic of Bancor protocol}
  spec.description   = %q{Implement the logic of Bancor protocol}
  spec.homepage      = "https://github.com/kurotaky/bancor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
