lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'study/version'

Gem::Specification.new do |spec|
  spec.name          = 'study'
  spec.version       = Study::VERSION
  spec.authors       = ['ayamschikov']
  spec.email         = ['yamshchikov.as73@gmail.com']

  spec.summary       = 'This is summary'
  spec.description   = 'This is description'
  spec.homepage      = 'http://example.com'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
