Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  get "/merchants", to: "merchants#index"
  get "/merchants/new", to: "merchants#new"
  get "/merchants/:id", to: "merchants#show"
  post "/merchants", to: "merchants#create"
  get "/merchants/:id/edit", to: "merchants#edit"
  patch "/merchants/:id", to: "merchants#update"
  delete "/merchants/:id", to: "merchants#destroy"

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"

  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"
  patch "/cart/:item_id/:increment_decrement", to: "cart#increment_decrement"

  get "/orders/new", to: "orders#new"
  post "/orders", to: "orders#create"
  get "/orders/:order_id", to: "orders#show"
  patch "/orders/:order_id", to: "orders#cancel"
  get "/profile/orders/:order_id", to: "orders#show"

  get "/register", to: "users#new"
  post "/users", to: "users#create"

  get "/profile", to: "users#show"
  get "/profile/orders", to: "orders#index"
  get '/profile/edit', to: 'users#edit'
  get '/profile/password_edit', to: 'users#password_edit'
  patch '/profile', to: 'users#update'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # ,as: :user
  namespace :merchant do
    get '/', to: "dashboard#index"
    patch '/items/:item_id', to: "items#toggle"
    get '/orders/:order_id', to: "orders#show"
    resources :items
    patch '/itemorders/:id/fulfill', to: "itemorders#fulfill"
  end

  namespace :admin do
    get '/', to: "dashboard#index"
    patch '/orders/:order_id/ship', to: "dashboard#ship"
    get '/users', to: "users#index"
    patch '/merchants/:merchant_id', to: "merchants#toggle"
    get '/merchants/:merchant_id', to: "merchants#show"
  end
  get '/admin/users/:user_id', to: "users#show"
end
