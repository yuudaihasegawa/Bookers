class BooksController < ApplicationController
  protect_from_forgery :index => [:destroy]


  def top #初期のページ
  end

  def index #main画面
    @books = Book.all.order('id DESC')
    @book = Book.new
  end

  def show #投稿詳細画面
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else#失敗
      render action: :edit
    end
  end

  def create #投稿機能
    @books = Book.all
  	@book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
  	  redirect_to book_path(@book)
    else
      render action: :index
    end
  end

  def edit #編集画面
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
