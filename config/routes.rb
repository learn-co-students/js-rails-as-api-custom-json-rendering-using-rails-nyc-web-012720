Rails.application.routes.draw do
  # get '/birds' => 'birds#index'
  resources :birds
end