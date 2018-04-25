class Api::V1::UsersController < ApplicationController

  def signup
    user = User.new(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])

    if user.save
      render json: {success: true, message: "user created"}, status: 201
    else
      render json: {success: false, errors: user.errors}, status: 422
    end
  end
end
