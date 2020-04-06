require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
      expect(user).to be_valid
    end

    it 'should fail to save user without matching password confirmations' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "def"
        )
      expect(user).to_not be_valid
    end

    it 'should fail to save user with same email' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
      user2 = User.create(
        last_name: "abc",
        first_name: "def",
        email: "ABC@abc.com",
        password: "123",
        password_confirmation: "123"
        )
      expect(user2).to_not be_valid
    end

    it 'should fail to save without first name' do
      user = User.create(
        last_name: "abc",
        first_name: nil,
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
        expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should fail to save without last name' do
      user = User.create(
        last_name: nil,
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
        expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should fail to save without email' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: nil,
        password: "123",
        password_confirmation: "123"
        )
        expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should fail to save user if password is less than three characters' do
    user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "12",
        password_confirmation: "12"
        )
        expect(user.errors.full_messages).to include
      "Password is too short (minimum is 3 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login valid user' do
      user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
        userA = User.authenticate_with_credentials(user.email, user.password)
      expect(userA).to be true
    end

    it "should login in user with capital letters in email" do
    user = User.create(
        last_name: "abc",
        first_name: "def",
        email: "abc@abc.com",
        password: "123",
        password_confirmation: "123"
        )
        userA = User.authenticate_with_credentials('ABc@abc.com', user.password)
      expect(userA).to be true
    end

    it "should login in user with spaces in email" do
      user = User.create(
          last_name: "abc",
          first_name: "def",
          email: "abc@abc.com",
          password: "123",
          password_confirmation: "123"
          )
          userA = User.authenticate_with_credentials("  abc@abc.com ", user.password)
        expect(userA).to be true
      end
  end
end