class HomeController < ApplicationController
  def index
    if current_user
      @things = Thing.accessible_by(current_ability)
    end
  end
end
