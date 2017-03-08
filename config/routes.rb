Rails.application.routes.draw do
  root 'homepage#index'
  resources :users do
    get '/albums' => 'albums#album'
  end
  resources :albums do
    resources :comments
  end

  get 'signup' => 'users#new'
  get 'account' => 'sessions#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#login'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
