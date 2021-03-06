class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    # ユーザ登録（sign_up）の際に、データ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])

    # ログイン登録（sign_in）の際に、データ操作を許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # ログイン後にマイページに遷移する
  def after_sign_in_path_for(resource)
    books_path(current_user) # 指定ページのパスを記述
  end

end
