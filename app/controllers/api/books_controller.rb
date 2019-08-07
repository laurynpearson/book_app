class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render 'index.json.jb'
  end
  def show
    @book = Book.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
