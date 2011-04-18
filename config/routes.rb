AuthApp::Application.routes.draw do
  devise_for :users

  resources :things

  root :to => "home#index"
end
