class UsersController < ApplicationController
  
  def show  #1 ユーザーマイページを表示
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

end