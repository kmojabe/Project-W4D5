require 'rails_helper'
describe User do 
  subject(:user) do
    User.create( username: 'Ricky', password: 'somethingelse' )
  end
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  it "creates a password digest when is given" do 
    expect(user.password_digest).to_not be_nil
  end
  
  it 'creates a session token' do
    expect(user.session_token).to_not be_nil
  end
  
  
  it 'initializes 12 cheers' do
    expect(user.cheers).to eq(12)
  end
  
  it 'returns false when password is incorrect' do
    expect(user.is_password?("somthing_incorrect")).to be_falsey
  end
  
  it 'correctly finds a user by the username and password' do
    user.save
    expect(User.find_by_credentials('Ricky','somethingelse')).to eq(user)
  end
  
  # it 'returns nil when username or password do not match database' do
  #   expect(User.find_by_credentials('Ricky','somethingelse')).to eq(nil))
  # end
  # 
  # describe "re"
end