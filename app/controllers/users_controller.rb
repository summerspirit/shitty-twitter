class UsersController < ApplicationController

  before_action :check_user_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @user_tweets = @user.tweets
  end

  def edit
  end
  
  def update
    @current_user.update_attributes(user_params)
    redirect_to user_path(@current_user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :handle)
  end

 
end
