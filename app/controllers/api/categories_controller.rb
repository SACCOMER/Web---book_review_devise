class Api::CategoriesController < Api::ApplicationController
  def index
    categories = Category.all
    render json: categories.as_json(only: [:id, :name])
  end
end