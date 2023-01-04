class BooksController < ApplicationController
    def index 
        @books = Book.all
    end
    
    def new
        @book = Book.new
    end

    def create
        book = Book.new(book_params)
        if book.save
            redirect_to :action =>"index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def destroy
        book = Book.find(params[:id])
    end

    private
    def book_params
        params.require(:books).permit(:title,:body)
    end
end
