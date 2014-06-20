Muenster::Application.routes.draw do

  resources :jobs
  resources :companies, only: [:index, :show, :create, :new, :edit, :update]
end
