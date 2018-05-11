class Api::V1::UsersController < ApplicationController

  def signup

    user = User.new user_params
    if user.save
      render json: {success: true, message: "user created"}, status: 201
    else
      render json: {success: false, errors: user.errors.full_messages}, status: 422
    end
  end

  def signin
    user = User.find_by_email(params['user']['email'])
    if user.present? && user.valid_password?(params['user']['password'])
      render json: {success: true, message: "user logged in"}, status: 201
    else
      render json: {success: false}, status: 422
    end
  end

  protected
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :dob, :contact_number, :role)
    end
end
