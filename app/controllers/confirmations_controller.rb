# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController
  def create
    if oauth_params.present? && user.save && authorization.save
      super
    else
      redirect_to questions_path, alert: 'Authorization failure'
    end
  end

  private

  def user
    @user ||= User.new(email: resource_params[:email], password: password, password_confirmation: password)
  end

  def authorization
    @authorization ||= user.authorizations.new(provider: oauth_params['provider'], uid: oauth_params['uid'])
  end

  def password
    @password ||= Devise.friendly_token[0, 20]
  end

  def oauth_params
    session['omniauth.auth']
  end
end
