class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #
  # Letting declarative authorization know who the current user is.
  #
  #before_filter { |c| Authorization.current_user = c.current_user }


  def permission_denied
    redirect_to root_url
  end
end
