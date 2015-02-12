Rails.application.routes.draw do
  root to: "leads#index"
  resource :session
  resources :users
  resources :charges
end
