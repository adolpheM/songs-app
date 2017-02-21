Rails.application.routes.draw do
  
get "/songs", to: 'songs#index'
get "/songs/new", to: 'songs#new'
get "/songs/:id", to: 'songs#show'
post "/songs", to: 'songs#create'
get "/songs/:id/edit", to: 'songs#edit'
patch "/songs/:id", to: 'songs#update'
delete "/songs/:id", to: 'songs#destroy'

end
