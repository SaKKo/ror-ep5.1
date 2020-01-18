class BooksController < ApplicationController
  def index
    books = Book.all.first(10)
    render json: { books: books.map{|b| b.as_api_json }, count: books.count }
  end
  def show
    book = Book.find(params[:id]) rescue nil
    if book.present?
      render json: book.as_api_json
    else
      render json: { status: 404, error: "Not found" }, status: :not_found
    end
  end
end
