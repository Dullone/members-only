Rails.application.routes.draw do
  get       'login'   => 'sessions#new'
  post      'login'   => 'sessions#create'
  delete    'logout'  => 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
end
