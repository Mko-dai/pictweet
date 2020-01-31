Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'      # root : トップページのアドレスを定義（localhost:3000で表示されるページ）
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end

#
# resource : Railsの7大アクション