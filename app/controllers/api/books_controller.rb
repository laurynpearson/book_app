class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render 'index.json.jb'
  end
  def show
    @book = Book.find_by(id: params[:id])
    render 'show.json.jb'
  end
  def create
    @book = Book.new(
      title: params[:title],
      pages: params[:pages]
      )
    @book.save
    render 'show.json.jb'
  end
  def update
    @book = Book.find_by(id: params[:id])
    @book.title = params[:title] || @book.title
    @book.pages = params[:pages] || @book.pages
    if @book.save
      render 'show.json.jb'
    else
      render json: {errors: @book.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render 'destroy.json.jb'
  end

end
