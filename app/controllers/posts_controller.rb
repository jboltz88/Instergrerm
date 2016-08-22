class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      flash[:success] = "Success, your post was submitted!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "@post.errors.full_messages"
      redirect_to new_post_path
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def permit_post
    params.require(:post).permit(:image, :description)
  end
end
