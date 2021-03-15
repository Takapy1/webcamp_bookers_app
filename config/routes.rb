Rails.application.routes.draw do
  root to: "homes#top"
  resources :books, only: [:index, :create, :edit, :update, :show, :destroy]
end
