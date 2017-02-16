Rails.application.routes.draw do
  
get "/songs", to: 'songs#index'
get "/songs/new", to: 'songs#new'
get "/songs/:id", to: 'songs#show'
post "/songs", to: 'songs#create'


end
