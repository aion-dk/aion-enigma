AionEnigma
======

AionEnigma is a small utility for encrypting/decrypting a string based on a shared secret using AES-265-CBC.

Install
-------

Install gem via git
```
gem 'aion-enigma'
```

Usage
-----

```ruby
secret_message = 'this is a secret message'
shared_secret  = 'some shared secret'

enigma = AionEnigma.new(shared_secret)
encrypted_message = enigma.encrypt(secret_message)
# encrypted_message ≈> 'ivBsGDsQjG6ScC5wq7Q-2w~XgFz1c4mdDR_MhI0VkpvNMcINDHCrAXEb1RlzwXpuNU'

message = enigma.decrypt(encrypted_message)
# message => 'this is a secret message'
```
