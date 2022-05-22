class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def destroy
    act = Activity.find(params[:id])
    # act.signups.destroy_all
    act.destroy
    head :no_content
  end
end
