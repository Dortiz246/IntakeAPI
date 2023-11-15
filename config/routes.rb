Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "patients#index"
  # Defines the root path route ("/")
  resources :patients, only: [:index, :create, :show, :destroy, :update]
  # root "articles#index"
  get 'index', to: 'patients#index'
  #additional routes for specific actions
end
