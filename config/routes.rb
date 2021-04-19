Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post '/npcs/save/:id', to: 'npc_models#new'
  get '/npcs/:id', to: 'npc_models#show'

  resources :users, only: [:create, :destroy]
  delete '/users/destroy/:id', to: 'users#destroy'

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
  end

  namespace :admin do
    get '/', to: "dashboard#show"
    resources :npcs, only: [:index]
    resources :users, only: [:index, :show]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
end
