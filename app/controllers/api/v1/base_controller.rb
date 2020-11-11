module Api
  module V1
    class BaseController < ApplicationController
      before_action :doorkeeper_authorize!

      check_authorization

      rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json do
            render status: :unprocessable_entity, json: exception.message
          end
        end
      end

      private

        def current_resource_owner
          @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
        end

        def current_ability
          @current_ability ||= Ability.new(current_resource_owner)
        end
    end
  end
end
