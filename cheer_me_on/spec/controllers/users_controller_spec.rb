require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #new
  #index, create, show
  describe "POST #create" do
    context "with valid params" do
      it "create a new user" do
        post :create, params: { user: { username: "jack_bruce", password: "password" } }
        expect(response).to render_template('new')
      end
    end
  end
  
  # describe "GET #indx" do
  # 
  #   it "displays all users"
  #   it "shows log in and sign up when logged out"
  #   it "has a logout button when logged in"
  # end
end
