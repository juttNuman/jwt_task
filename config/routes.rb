Rails.application.routes.draw do
  resources :users
  resources :products
  post '/auth/login' , to: 'authentication#login'
end
