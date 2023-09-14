class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      sign_in(user) # ユーザーをログイン状態にする
      redirect_to root_path # ログイン成功時にトップページにリダイレクト
    else
      flash[:alert] = 'ログインに失敗しました。'
      render :new
    end
  end
end
