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
  def create
    book = Book.new(name: params[:name])
    if book.save
      render json: book.as_api_json
    else
      render json: { status: 400, errors: book.errors.as_json }, status: :bad_request
    end
  end
  def update
    book = Book.find(params[:id]) rescue nil
    if book.present?
      book.name = params[:name]
      if book.save
        render json: book.as_api_json
      else
        render json: { status: 400, errors: book.errors.as_json }, status: :bad_request
      end
    else
      render json: { status: 404, error: "Not found" }, status: :not_found
    end
  end
  def destroy
    book = Book.find(params[:id]) rescue nil
    if book.present?
      if book.destroy
        render json: { status: 200, id: book.id }
      else
        render json: { status: 400, errors: book.errors.as_json }, status: :bad_request
      end
    else
      render json: { status: 404, error: "Not found" }, status: :not_found
    end
  end
end
