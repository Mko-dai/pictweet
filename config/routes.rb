# routes.rbファイルでは、呼び出すコントローラアクションのURLを定義
# $bundle exec rake routesコマンドで、routes.rbで定義したURLとコントローラアクションの組み合わせの一覧が表示される

Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'  #1   
    resources :tweets do   #2
    resources :comments, only: [:create]  #3
  end
  resources :users, only: [:show]
end

#1 tweetsコントローラーのindexアクションのURLをlocalhost:3000とする
## root → トップページのアドレスを定義（localhost:3000で表示されるページ）
## 'tweets#index' → tweetsコントローラーのindexアクション

#2 tweetsコントローラーのRails7大アクションとURLの組み合わせを自動的に生成
## resources → Rails7大アクション(index, show, new, create, edit, update, destroy)
## :tweets → tweetsコントローラー
## do ~ end → ~ の中のURLの先頭に/tweets/:tweet_idをつける

#3 commentsコントローラーのRails7大アクションのcreateのみ、URLを自動的に生成
## resources → Rails7大アクション(index, show, new, create, edit, update, destroy)
## :comments → commentsコントローラー
## only: [:create] → Rails7大アクションのうち、createのみを使用