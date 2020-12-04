class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users, include: :entries
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.find_or_create_by(user_params)

    if @user.save
      render json: @user, status: :created, location: @user, include: :entries
    else
      render json: @user.errors, status: :unprocessable_entity, include: :entries
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(id: params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name)
    end
end
