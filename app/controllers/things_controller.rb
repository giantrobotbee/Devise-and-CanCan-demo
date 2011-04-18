class ThingsController < ApplicationController
  before_filter :authenticate_user!
  check_authorization
  load_and_authorize_resource

  def new
    @thing = Thing.new(:user => current_user)
  end

  def create
    @thing = Thing.new(params[:thing])
    if @thing.save
      flash[:notice] = "You've made a thing!"
      redirect_to root_url
    else
      flash[:error] = "There was a problem creating your thing."
      render :new
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
