class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		params[:session][:remember_me] == '1' ? remember(user) : forgot(user)
  		redirect_to user
  	else
  	  flash.now[:danger] = "輸入的密碼錯誤或者信箱不存在"
  		render :new
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
