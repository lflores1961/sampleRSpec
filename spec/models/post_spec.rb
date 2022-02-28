require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: "SomeGuy@example.com", password: 'password', password_confirmation: 'password' )

  it "Has a title" do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = 'Now has a title'
    expect(post).to be_valid  
  end

  it "Has a body" do
    post = Post.new(
      title: 'Has a valid Title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    
    post.body = "Has a body part"
    expect(post).to be_valid 
  end

  it "Has a title at least 2 characters long" do
    post = Post.new(
      title: '1',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = '12'
    expect(post).to be_valid
  end

  it "Has a body between 5 and 100 characters" do
    post = Post.new(
      title: '12',
      body: '1234',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    
    post.body = "12345"
    expect(post).to be_valid
    
    hundred_char_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m'
    
    post.body = hundred_char_string
    expect(post).to be_valid
    
    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid 
  end

end
