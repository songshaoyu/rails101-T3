class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :edit]



  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
