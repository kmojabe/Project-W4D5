class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
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
  
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end


#save_and_open_page