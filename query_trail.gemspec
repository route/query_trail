Gem::Specification.new do |spec|
  spec.name          = 'query_trail'
  spec.version       = '1.0'
  spec.authors       = ['Dmitry Vorotilin']
  spec.email         = ['d.vorotilin@gmail.com']
  spec.summary       = "Shows the trace of your queries when they're fired"
  spec.homepage      = 'https://github.com/route/query_trail'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
