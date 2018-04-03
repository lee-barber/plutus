Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get 'main/about'
  get 'main/search'
  post "/main/search" => 'main/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
