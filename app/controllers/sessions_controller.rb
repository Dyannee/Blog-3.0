class SessionsController < ApplicationController
  def new
  end
  def login
    @auth = AuthUser.new(authenticate_params)
    if @auth.login_succesful?
      session[:user_id] = @auth.user_id
      redirect_to '/'
    else
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  private
  def authenticate_params
    params.require(:authuser).permit(:email, :password)
  end
end
