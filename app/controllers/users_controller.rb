class UsersController < ApplicationController

before_action :baria_user, only: [:edit, :update, :crate, :new]

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  def edit
        @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully saved"
       redirect_to user_path(@user.id)
    else
     render "edit"
    end
  end

  private
  	def user_params
   	 params.require(:user).permit(:name, :introduction, :image)
   end
   def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
   end
end
