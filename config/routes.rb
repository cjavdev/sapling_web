Rails.application.routes.draw do
  root to: "users#show"
  resource :session
  resources :users
end
