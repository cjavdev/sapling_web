class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_params(params[:user])
    if user
      redirect_to root_url
    else
      flash[:errors] = ["Invalid email or password"]
      render :new
    end
  end
end
