Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  devise_for :admins
  root to: 'dashboard#index'
  get 'dashboard/index' => 'dashboard#index'

  resources :subjects
  resources :courses
end
