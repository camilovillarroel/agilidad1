Rails.application.routes.draw do
  root 'products#index'
  get 'products/index'
  devise_for :users
  
  get '/shopping_cart', to: 'orders#index', as: 'orders'
  resources :products, only: [:index] do
    resources :orders, only: [:create] 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
