Rails.application.routes.draw do
  root to: "charges#new"
  resource :session
  resources :users
  resources :charges
end
