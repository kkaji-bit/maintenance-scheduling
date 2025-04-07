Rails.application.routes.draw do
  resources :maintenances, only: %i[index show new edit destroy]
  resources :one_time_schedule_maintenances, only: %i[create update]
end
