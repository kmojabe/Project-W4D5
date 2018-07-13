class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def logged_in?
    return true if session[:session_token]
    return false
  end
  
  def logout
    if logged_in?
      current_user.reset_session_token!
    end
    session[:session_token] = nil
  end
  
  def current_user
    user = User.find_by(session_token: session[:session_token])
    user.nil? ? nil : user
  end
end
