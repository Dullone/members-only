class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(text: params[:post][:text])
    @post.user_id = current_user
    #unless post.text.empty? && @post.user_id
    @post.save
    #end
    redirect_to posts_url
  end

  private
    def logged_in_user
      redirect_to(login_path) unless current_user?
    end
end
