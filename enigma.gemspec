Gem::Specification.new do |s|
  s.name        = 'enigma'
  s.version     = '0.0.1'
  s.date        = '2016-09-06'
  s.summary     = 'Encryption utility based on AES'
  s.description = 'Small utility for encrypting/decrypting a string based on a shared secret. Based on AES-265-CBC.'
  s.authors     = ['Michael Andersen', 'Eugene Zainchkovskyy']
  s.email       = ['michael@aion.dk', 'eugene@3bytesahead.com']
  s.homepage    = 'https://github.com/aion-dk/enigma'
  s.files       = Dir.glob('lib/**/*') + %w(README.md)
  s.license     = 'MIT'

  s.add_development_dependency 'rake', '~> 11.2'
  s.add_development_dependency 'minitest', '~> 5.9'

end