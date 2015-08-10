module ApplicationHelper
  
  def current_user
    @user ||= User.where("id=?", session[:user_id]).first
  end
  helper_method :current_user
  
  def require_login
    if !logged_in?
      redirect_to :login
    end
  end
  
  def logged_in?
    !current_user.nil? && !current_user.id.nil?
  end
  helper_method :logged_in?
  
end
