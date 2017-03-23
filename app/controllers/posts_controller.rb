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

  def destroy
    @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
    flash[:notice] = "Update Success"
    redirect_to account_posts_path
  else
    render :edit
  end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
