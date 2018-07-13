require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #new
  #index, create, show
  describe "POST #new" do
    context "with valid params" do
      it "create a new user" do
        #save_and_open_page
        post :new, params: { user: { username: "jack_bruce", password: "password" } }
        expect(response).to render_template('new')
      end
    end
  end
  
  describe "GET #index" do
    it "displays all users" do 
      get :index
      # save_and_open_page
      expect(response).to render_template('index')
    end
  
    # it "shows log in and sign up when logged out"
    # it "has a logout button when logged in"
  end
end
