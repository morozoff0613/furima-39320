Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only:[:create]
  post '/login', to: 'sessions#create'
end
