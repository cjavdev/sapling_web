class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_params(params[:user])
    if user
      login(user)
      redirect_to root_url
    else
      flash[:errors] = ["Invalid email or password"]
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end

  def destroy
    current_user.try(:reset_session_token!)
    session[:token] = nil
    redirect_to new_session_path
  end
end
