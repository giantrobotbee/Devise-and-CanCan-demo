class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.id.blank?
      if user.admin?
        can :manage, :all
      else
        can :manage, Thing, :user_id => user.id
      end
    end
  end
end
