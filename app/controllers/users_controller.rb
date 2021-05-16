class UsersController < ApplicationController
before_action :correct_user, only:[:edit]
  def index
    @book = Book.new
    @users = User.all
    @book.user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book.user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user succesfully."
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
end
