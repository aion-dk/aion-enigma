require 'minitest/autorun'
require 'aion_enigma'

class AionEnigmaTest < Minitest::Test

  def setup
    @secret = 'some shared secret'
    @enigma = AionEnigma.new(@secret)
  end

  def test_non_string_secret
    assert_raises ArgumentError do
      AionEnigma.new({})
    end
  end

  def test_non_string_input_1
    assert_raises ArgumentError do
      @enigma.encrypt(1)
    end
  end

  def test_non_string_input_2
    assert_raises ArgumentError do
      @enigma.encrypt({test:'data'})
    end
  end

  def test_string_output
    encrypted_message = @enigma.encrypt('this is a test string')
    assert_kind_of String, encrypted_message
  end

  def test_diff_output
    n = 1000
    values = n.times.map { 'this is a test string' }
    encrypted_messages = values.map { |m| @enigma.encrypt(m) }

    assert_equal n, encrypted_messages.uniq.size
  end

  def test_decrypt
    message_in        = 'this is a string to encrypt'
    encrypted_message = @enigma.encrypt(message_in)
    message_out       = @enigma.decrypt(encrypted_message)

    assert_equal message_in, message_out
  end

  def test_other_enigma
    secret = 'shared secret for testing 123'

    enigma1 = AionEnigma.new(secret)
    enigma2 = AionEnigma.new(secret)

    message_in        = 'this is a string to encrypt'
    encrypted_message = enigma1.encrypt(message_in)
    message_out       = enigma2.decrypt(encrypted_message)

    assert_equal message_in, message_out
  end

  def test_secret_mismatch
    enigma1 = AionEnigma.new('secret 1')
    enigma2 = AionEnigma.new('secret 2')

    message_in        = 'testing mismatch'
    encrypted_message = enigma1.encrypt(message_in)

    assert_raises AionEnigma::DecryptError do
      enigma2.decrypt(encrypted_message)
    end
  end

  def test_readme_example
    secret_message = 'this is a secret message'
    shared_secret  = 'some shared secret'

    enigma = AionEnigma.new(shared_secret)
    encrypted_message = enigma.encrypt(secret_message)
    # encrypted_message ≈> 'ivBsGDsQjG6ScC5wq7Q-2w~XgFz1c4mdDR_MhI0VkpvNMcINDHCrAXEb1RlzwXpuNU'

    message = enigma.decrypt(encrypted_message)
    # message => 'this is a secret message'

    assert_equal secret_message, message
  end

end