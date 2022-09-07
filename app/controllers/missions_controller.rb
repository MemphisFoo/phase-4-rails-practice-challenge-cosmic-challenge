class MissionsController < ApplicationController

    def  create
        Mission.create!(mission_params)
        render json: Planet.find(params[:planet_id]), status: :created
    end

    private
    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
