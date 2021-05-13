class BooksController < ApplicationController
    def index
      @book = Book.new
      
    end
    
    def show
      @book = Book.new
      @name = user.name
    end
    
    def new
      @book = Book.new
    end
    
    def create
      book = Book.new
      book.save
      redirect_to 'user_path'
    end
    
    private
    def book_params
      params.repuire(:book).permit(:title, :body, :image)
    end
end
