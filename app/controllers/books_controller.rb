class BooksController < ApplicationController

  def top #初期のページ
  end

  def index #main画面
    @books = Book.all
    @book = Book.new
  end

  def show #投稿詳細画面
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def create #投稿機能
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_params
  end

  def edit #編集画面
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
