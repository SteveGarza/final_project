class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :categories, :brands

  def categories
  	@categories = Category.order(:name)
  end

  def brands
  @brands = Product.pluck(:brand).sort.uniq
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :bio, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :bio, :location])
  end
end
