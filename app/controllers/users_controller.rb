class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    redirect_if_not_logged_in
    #binding.pry
    @user = User.find(params[:id])
    
  end

  def reviews
    @user = User.find(params[:id])
    #render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
  
end
