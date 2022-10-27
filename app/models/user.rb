class User < ApplicationRecord
    include Clearance::User

    # has_secure_password

    # validates :name, presence: true
    validates :email, :uniqueness => { :case_sensitive => false }, presence: true
    validates :password, presence: true, length: { minimum: 3 }
    # validates :password_confirmation, presence: true


    def self.authenticate_with_credentials(email, password)
      
      email = email.downcase.strip
      @user = User.find_by_email(email)


      # byebug
      if @user && @user.authenticated?(password)
      # if @user

        return @user

      else 

        return nil
      end
    end
  end


 