require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'should not save tweet without body' do
    tweet = Tweet.new
    assert_not tweet.save, 'Attempted saving the tweet without a body'
  end

  test 'should not save tweet with body longer than 280 characters' do
    tweet = Tweet.new(body: 'a' * 281)
    assert_not tweet.save, 'Attempted Saving the tweet with a body longer than 280 characters'
  end

  test 'should save tweet with valid body' do
    tweet = Tweet.new(body: 'This is a valid tweet.')
    assert tweet.save, 'Could not save the tweet with a valid body'
  end

  test 'default values for likes_count and retweet_count' do
    tweet = Tweet.create(body: 'Another valid tweet.')
    assert_equal 0, tweet.likes_count, 'Default likes_count is not 0'
    assert_equal 0, tweet.retweet_count, 'Default retweet_count is not 0'
  end

  test 'default value for username' do
    tweet = Tweet.create(body: 'Yet another valid tweet.')
    assert_equal 'Tweeter', tweet.username, "Default username is not 'Tweeter'"
  end
end
