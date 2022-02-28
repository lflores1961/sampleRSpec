require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation test" do
    it 'Rejects invalid email' do
      user = User.new(email: 'wrong.email.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end
    it 'Accepts valid email' do
      user = User.new(email: 'good@email.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(true)
    end
  end
  
end
