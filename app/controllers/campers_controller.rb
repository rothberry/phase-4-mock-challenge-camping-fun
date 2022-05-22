class CampersController < ApplicationController
  def index
    campers = Camper.all
    render json: campers #, serializer: CamperSerializer
  end

  def show_by
    camper = Camper.find_by(id: params[:id])
    if camper
      render json: camper, serializer: CamperShowSerializer
    else
      render json: { error: "Camper with id=#{params[:id]} Not Found" }, status: :not_found
    end
  end

  def show_rescue
    begin
      camper = Camper.find(params[:id])
      render json: camper, serializer: CamperShowSerializer
    rescue ActiveRecord::RecordNotFound => err
      render json: { error: err }, status: :not_found
    end
  end

  def show
    puts "SHOW********"
    camper = Camper.find(params[:id])
    render json: camper, serializer: CamperShowSerializer
  end

  def create_by
    puts "CREATING........."
    new_camper = Camper.create(camper_params)
    if new_camper.id
      render json: new_camper, status: :created
    else
      render json: { errors: new_camper.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create_rescue
    puts "CREATING........."
    begin
      new_camper = Camper.create!(camper_params)
      render json: new_camper, status: :created
    rescue ActiveRecord::RecordInvalid => err
      render json: { errors: err.record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    puts "CREATINGgajshdg........."
    new_camper = Camper.create!(camper_params)
    render json: new_camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
