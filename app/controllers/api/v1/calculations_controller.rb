module Api
    module V1
      class CalculationsController < ApplicationController
        def calculate
          result = StringCalculator.add(params[:numbers])
          render json: { result: result }
        rescue => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end
    end
end