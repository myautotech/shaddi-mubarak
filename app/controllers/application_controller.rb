class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_language

  rescue_from CanCan::AccessDenied do
    redirect_to root_url, alert: t('cancan_alert')
  end

  private

  def set_language
    I18n.locale = current_user.language if current_user
  end
end