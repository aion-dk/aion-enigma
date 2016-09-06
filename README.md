Enigma
======

Enigma is a small utility for encrypting/decrypting a string based on a shared secret using AES-265-CBC.

Install
-------

Install gem via git
```
gem 'enigma', git: 'git@github.com:aion-dk/enigma'
```

Usage
-----

```ruby
secret_message = 'this is a secret message'
shared_secret  = 'some shared secret'

enigma = Enigma.new(shared_secret)
encrypted_message = enigma.encrypt(secret_message)
# encrypted_message ≈> 'Gn3AZKG9aqv+ALTfI9ZbuQ==|7hI5iN1Jdm73zQB1nTBngX07SaX60nuirWQRtNygIgE='

message = enigma.decrypt(encrypted_message)
# message => 'this is a secret message'
```
