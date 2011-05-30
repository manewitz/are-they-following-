require 'rubygems'
require 'twitter'
require 'sinatra'

Twitter.configure do |config|
  config.consumer_key = "INSERT_YOUR_KEY_HERE"
  config.consumer_secret = "INSERT_YOUR_KEY_HERE"
  config.oauth_token = "INSERT_YOUR_KEY_HERE"
  config.oauth_token_secret = "INSERT_YOUR_KEY_HERE"
end

def twitter_id(screen_name)
  Twitter.user(screen_name).id
end

def is_following?(a,b)
  followers = Twitter.follower_ids(twitter_id(b)).ids
  followers.include?(twitter_id(a))
end

get '/' do

  erb :index
end

get '/follows' do
  @user1 = params[:user1]
  @user2 = params[:user2]

  @following = is_following?(@user1, @user2)

  erb :follows
end