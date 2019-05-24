# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Event
    if user.present?
      can :read, Ticket
      cam :read, User, id: user.id
      can :create, UserTicket, user_id: user.id
      can :manage, UserTicket, user_id: user.id

      if user.admin?
        can :create, :all
        can :manage, :all
      end
    end
  end
end
