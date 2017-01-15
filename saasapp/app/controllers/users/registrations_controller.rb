class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resources|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end