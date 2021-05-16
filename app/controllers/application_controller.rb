class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
  user_path(resource)
end
before_action :authenticate_user!,except:[:top]
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
