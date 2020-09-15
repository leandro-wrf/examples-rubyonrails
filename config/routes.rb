Rails.application.routes.draw do
  get '/user', to: 'user#index'
  get '/user/:id', to: 'user#show'
  post '/user', to: 'user#create'
  put '/user/:id', to: 'user#update'
  delete '/user/:id', to: 'user#destroy'
  # this routes can it replace by
  # resources '/user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
