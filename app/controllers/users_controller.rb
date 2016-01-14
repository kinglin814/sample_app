class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params_user)
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to user_path(@user)
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  	
  end


  private

  def params_user
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
