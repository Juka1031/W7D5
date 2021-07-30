Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :index, :create] do 
    resources :posts, only: [:edit, :update]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: [:destroy]

  resources :posts, only: [:new, :create, :destroy, :show]

end
