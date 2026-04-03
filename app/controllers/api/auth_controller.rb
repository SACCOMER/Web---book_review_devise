class Api::AuthController < Api::ApplicationController
  def signup
    user = User.new(user_params)

    if user.save
      render json: {
        message: "User created successfully",
        user: {
          id: user.id,
          username: user.username,
          email: user.email
        }
      }, status: :created
    else
      render json: {
        errors: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      render json: {
        message: "Login successful",
        user: {
          id: user.id,
          username: user.username,
          email: user.email
        }
      }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end