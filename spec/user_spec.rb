require "rails_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should validate user' do
      test_account = User.create(
        email:'test@gmail.com',
        encrypted_password:'abc123',
        password:'abc123',
      )
      puts test_account.errors.full_messages
      puts 'registeration is valid'
      expect(test_account).to be_valid
    end

    it 'should fail because user did not enter email' do 
      test_account = User.create(
        email:nil,
        encrypted_password:'abc123',
        password: 'abc123'
      )
      puts test_account.errors.full_messages
      expect(test_account).to_not be_valid  
    end
    
    fit 'should fail because password does not match' do 
      original_password = "abc123"
      incorrect_password = "this should not authenticated properly"
      
      test_account = User.create(
        email:'test@gmail.com',
        password: original_password,
      )
      
      puts test_account.errors.full_messages
      
      expect(test_account.authenticated?(incorrect_password)).to be(false)
    end

    it 'should fail because new user used email already in system' do 
      test_account = User.create(
        email:'test@gmail.com',
        encrypted_password:'abc123',
        password: 'abc123'
      )
      puts test_account.errors.full_messages
      expect(test_account).to be_valid  

      test_account_2 = User.create( 
        email: 'TESt@GMAIL.COM',
        encrypted_password:'abc123',
        password: 'abc123'
      )
      puts "=>", test_account_2.errors.full_messages[0]
      expect("Email has already been taken").to eq(test_account_2.errors.full_messages[0]) 
    end
  

  end

end
