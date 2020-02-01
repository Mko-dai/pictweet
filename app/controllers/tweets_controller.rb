#各アクションの処理を定義


class TweetsController < ApplicationController

  def index #1 DBから投稿を抽出し、トップページを表示
    @tweets = Tweet.all.order("created_at DESC")
  end

  def new #2 投稿作成ページを表示
  end

  def create #3 作成された投稿をDBに保存し、投稿完了ページを表示
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text],user_id: current_user.id)
  end

  def destroy #4 投稿を削除し、削除完了ページを表示
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit #5 投稿編集ページを表示
    @tweet = Tweet.find(params[:id])
  end

  def update #6 編集された投稿を保存し、完了ページを表示
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
  end

  def show #7 投稿詳細ページを表示
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
   
  end
end
