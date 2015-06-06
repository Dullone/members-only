module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    user.remember
    cookies.permanent[:remember_me] = user.remember_me
  end

  def current_user
    if user = session[:user_id]
      @current_user = user
    elsif token = cookies[:remember_me]
      @current_user ||= User.find_by_remember_me(User.digest(token))
      if @current_user
        log_in(@current_user)
        @current_user.id
      end
    else
      nil
    end
  end

  def current_user=(user)
    session[:user_id] = user
  end

  def current_user?
    !current_user.nil?
  end

  def sign_out
    session.delete :user_id
    cookies.delete :remember_me
    @current_user = nil
  end

end
