class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorized
    if !logged_in?
      flash[:errors] = "You must be logged in to view page"
      redirect_to login_path
    end
  end
  
end
