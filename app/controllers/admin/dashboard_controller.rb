class Admin::DashboardController < ApplicationController
  before_action :require_current_user,
                :require_admin,
                :check_if_saving_npc

  def show
    @npcs = current_user.npc_models
  end
end
