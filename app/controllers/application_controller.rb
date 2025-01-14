class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    private

    def render_not_found_response(e)
        render json: { error: "#{e.model} not found"}, status: :not_found
    end

    def render_unproccessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages}, status: :unprocessable_entity 
    end
end
