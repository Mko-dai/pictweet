class CommentsController < ApplicationController
  
  def create #1 投稿へのコメントをDBに保存し、表示
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id]) }
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end