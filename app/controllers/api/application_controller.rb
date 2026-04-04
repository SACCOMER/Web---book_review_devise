class Api::ApplicationController < ActionController::API
  before_action :authenticate_api_user!

  private

  def authenticate_api_user!
    auth_header = request.headers["Authorization"]
    token = auth_header&.split(" ")&.last

    if token.blank?
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end

    @current_api_user = User.find_by(auth_token: token)

    unless @current_api_user
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def current_api_user
    @current_api_user
  end
end