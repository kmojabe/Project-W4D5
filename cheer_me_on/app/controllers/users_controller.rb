class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def new
    render :new
  end
  
  def index
    render :index
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end