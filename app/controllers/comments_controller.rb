class CommentsController < ApplicationController
before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      ActionCable.server.broadcast "comments",
                                   render(partial: 'comments/comment', object: @comment)
      flash[:notice] = "Comment has been created"
    else
      flash[:alert] = "Comment has not been created"
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author_id, :removed)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
