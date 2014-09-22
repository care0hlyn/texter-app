Rails.application.routes.draw do

  root :to => 'home#index'

  devise_for :users, :path => 'accounts'
  resources :users, :except => [:index] do
    resources :contacts do
      resources :messages, :only => [:index, :new, :create, :show]
    end
  end
end
