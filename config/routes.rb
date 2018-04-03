Rails.application.routes.draw do
  # auto-generated when currency Model was created via scaffold
  resources :coins
  # auto-generated when User model was created via devise gem
  devise_for :users
  root 'main#index'
  get 'main/about'
  get 'main/search'
  post "/main/search" => 'main/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
