class TweetsController < ApplicationController

  #before_action :check_user_login

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @current_user
    @tweet.save
    redirect_to tweets_path
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

 
end
