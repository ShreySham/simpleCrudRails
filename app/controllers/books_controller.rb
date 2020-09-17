class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end  
  
  def new
    @book = Book.new
    @genres = ["Mystery", "Romance", "Science Fiction", "Fantasy", "Non-Fiction"]
    @genres.map{|k| [k,k]}
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book created successfully!"
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
    @genres = ["Mystery", "Romance", "Science Fiction", "Fantasy", "Non-Fiction"]
    @defaultDate = @book.published_date.to_s
    @genres.map{|k| [k,k]}
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book updated successfully!"
      redirect_to(book_path(@book))
    else
      render('edit')
    end
  end



  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted successfully!"
    redirect_to(books_path)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price,:published_date)
  end
end
