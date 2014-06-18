Muenster::Application.routes.draw do

  resources :jobs, only: [:index, :show, :new, :create]
  resources :companies, only: [:index, :show, :create, :new, :edit, :update]
end
