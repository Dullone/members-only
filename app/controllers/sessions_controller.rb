class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_url
    else
      flash.now[:notice] = "Error, incorrect login information."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to posts_url
  end

end
