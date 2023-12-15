class HomeController < ApplicationController
  def index
    #@users = User.all
    #@users = User.limit(16).order(:created_at)
    @q = User.ransack(params[:q])
    @users = @q.result.limit(16).order(:created_at)
  end
end
