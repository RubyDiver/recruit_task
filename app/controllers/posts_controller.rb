class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post has been created"
      redirect_to posts_path
    else
      flash[:danger] = "Post has not been created"
      render :new
    end
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post has been updated"
      redirect_to @post
    else
      flash[:danger] = "Post has not been updated"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post has been deleted"
      redirect_to posts_path
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
