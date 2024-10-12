Rails.application.routes.draw do
  root "rooms#index"
  
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :users 
  resources :rooms do 
    resources :messages
  end
end
