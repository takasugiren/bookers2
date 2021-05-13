Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about"
  post 'books' => 'books#create'
  resources :books, only: [:new, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
end
