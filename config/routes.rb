Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions',
      :passwords => 'users/passwords'
  }

  resources :users, only: [:index]

  devise_scope :user do
    authenticated :user do
      root 'users#index', :to => "users#index", as: :authenticated_root
      get "sign_out", :to => "users/sessions#destroy"
    end

    unauthenticated do
      root 'users/sessions#new', :to => "users/sessions#new",  as: :unauthenticated_root
    end
  end

end
