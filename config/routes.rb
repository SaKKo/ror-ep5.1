Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'books', to: 'books#index'
  get 'books/:id', to: 'books#show'
  post 'books', to: 'books#create'
  match 'books/:id', to: 'books#update', via: [:put, :patch]
  delete 'books/:id', to: 'books#destroy'
end
