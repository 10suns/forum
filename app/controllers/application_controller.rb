class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CRUDFeature

  devise_group :user, contains: [:admin, :teacher, :student]

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def after_sign_out_path_for(resource)
    send("new_#{resource.to_s}_session_path")
  end
end
