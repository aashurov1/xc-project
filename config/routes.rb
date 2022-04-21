Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # get 'superheroes', to: 'superheroes#index'
  # or convention:

  root to: redirect('/users/show')

  resources :users, only: [:new, :show, :create, :destroy]

  resource :session, only: [:new, :create, :destroy]
  
end
