Rails.application.routes.draw do
  resources :cocktails do
    resources :doses do
    end
  end

  resources :cocktails
  resources :doses
  resources :ingredients

  root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
