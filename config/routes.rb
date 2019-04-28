Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :update, :index]
  get 'home' => 'homes#top'
  get 'home/about' => 'homes#about'

end
