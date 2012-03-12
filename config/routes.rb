Hotspot1::Application.routes.draw do
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"
  resources :hotspots
  resources :users
  resources :sessions
   
  #get "hotspots/index"
  #get "hotspots/new"
  #get "hotspots/create"
  #get "hotspots/show"
  root :to => 'hotspots#index'
end
