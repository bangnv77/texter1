Rails.application.routes.draw do
  root 'application#index'
  resources :messages, :only => [:index, :new, :create, :show]
end
