Rails.application.routes.draw do
 
  devise_for :users, :controllers => {:registrations => "registrations"}
    devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end

    root 'users#show'
 
    resources :games, only: [:index, :show, :new, :create] do
      resources :reviews
    end
  
    resources :users do
      resources :reviews
    end
  
    resources :reviews
  
end
