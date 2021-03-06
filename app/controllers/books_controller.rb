class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_url(@book)
    else
      # ページ遷移したときにindexアクションが呼ばれるわけではなく、
      # indexテンプレが呼ばれるだけなので@booksの初期化が必要。
      # オブジェクト(@book)はindexアクションで生成して、見つけてきているので初期化の必要はない
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_url
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
