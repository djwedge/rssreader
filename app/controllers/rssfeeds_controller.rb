class RssfeedsController < ApplicationController

  def index
  end

  def new
  end

  def create
    render plain: params[:rssfeed].inspect
  end

end
