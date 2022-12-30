Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "todos#index"

  resources :todos
  get 'delete_completed', to: 'todos#delete_completed'
end
