class UsersController < ApplicationController

  before_action :check_user_login

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :handle)
  end

  def check_user_login
    @current_user = User.find(session[:user_id])
  end
end
