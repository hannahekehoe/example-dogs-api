class DogsController < ApplicationController
  def create
    pp current_user
    dog = Dog.new(
      user_id: current_user.id,
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
    )
    if dog.save
      render json: { message: "Dog created successfully" }, status: :created
    else
      render json: { errors: dog.errors.full_messages }, status: :bad_request
    end
  end
end
