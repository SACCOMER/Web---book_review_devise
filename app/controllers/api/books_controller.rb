class Api::BooksController < Api::ApplicationController
  def index
    books = Book.includes(:categories)

    render json: books.as_json(
      only: [:id, :title, :author],
      include: {
        categories: { only: [:id, :name] }
      }
    )
  end

  def show
    book = Book.find_by(id: params[:id])

    if book
      render json: book.as_json(
        only: [:id, :title, :author],
        include: {
          categories: { only: [:id, :name] },
          reviews: { only: [:id, :content, :rating] }
        }
      )
    else
      render json: { error: "Book not found" }, status: :not_found
    end
  end
end