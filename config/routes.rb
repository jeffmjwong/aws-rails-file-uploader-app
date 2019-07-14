Rails.application.routes.draw do
  root to: 'main#home'

  post '/upload', to: 'main#upload', as: 'main_upload_path'
end
