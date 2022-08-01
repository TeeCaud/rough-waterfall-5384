Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers, only:[:show] do
  end
  resources :supermarkets, only:[:show] do
  end
  get "supermarkets/:id/items", to: 'supermarket_items#index'
end
