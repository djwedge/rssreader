class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    # this.title = title ...
    @title = title
    @summary = summary
    @date = date
    @url = url
    @status = false # false pour non-lu, true pour lu
    # @item.save # ne fonctionne pas ici mais ok dans RssfeedsController (?)
  end
end