Rails.application.routes.draw do
  devise_for :users, class_name: "User", path: "", path_names: {
      sign_in: :login,
      sign_out: :logout
  }
  root to: 'dashboard#index'
  get 'dashboard/index' => 'dashboard#index'
end
