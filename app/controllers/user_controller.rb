class UserController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])

    render json: @user, status: :ok
  end

  def create
    @user = User.new(params_create_user);
    @user.save

    render json: @user, status: :created
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:username))

    render json: @user, status: 201
  end

  def destroy
    @user = User.where(id: params[:id]).first
    @user.destroy

    render status: 204
  end

  private

  # this method private, it's good pattern
  # case i'm use in methods what needed
  # remember DRY 
  def params_create_user
    params[:user]
      .permit(
        :username,
        :email,
        :password
      )
  end
end
