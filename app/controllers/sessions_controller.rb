class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user.authenticate(params[:session][:password])
      render text: "success"
    else
      render :new
    end
  end
end
