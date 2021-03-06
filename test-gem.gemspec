# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'test/gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'test-gem'
  spec.version       = Test::Gem::VERSION
  spec.authors       = ['Orlando Castillo']
  spec.email         = ['orlando.castillo@coinbase.com']

  spec.summary       = 'Summary'
  spec.description   = 'Description'
  spec.homepage      = 'https://github.com/orlandoc01/test-gem'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = spec.homepage

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'sorbet-runtime'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-sorbet'
  spec.add_development_dependency 'sorbet'
end
