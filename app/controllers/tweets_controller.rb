class TweetsController < ApplicationController
  before_action :find_tweet, only: %i[ like retweet destroy]
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :index, alert: "Unable to post your tweet"
    end
  end

  def like
    @tweet.increment(:likes_count).save

    redirect_to tweets_path
  end

  def retweet
    @tweet.increment(:retweet_count).save

    redirect_to tweets_path
  end

  def destroy
    @tweet.destroy

    redirect_to tweets_path, notice: "Tweet successfully deleted!"
  end

  private

  def tweet_params
    params.expect(tweet: [ :body ])
  end

  def find_tweet
    @tweet = Tweet.find_by(id: params[:id])
    if !@tweet
      redirect_to tweets_path, alert: "Cannot process action: Tweet not found."
    end
  end
end
