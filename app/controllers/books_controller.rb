class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully created"
      redirect_to books_path
    else
      @books = Book.all
      @book = Book.new
      @user = current_user
      render 'index'
    end

  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "successfully updated"
       redirect_to books_path
    else
      @book = Book.find(params[:id])
      render "edit"
    end
end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path,notice: "successfully delete "
  end

  private
    def book_params
      params.require(:book).permit(:title, :option)
    end
end
