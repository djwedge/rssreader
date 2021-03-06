class RssfeedsController < ApplicationController
  require 'rss'
  require 'open-uri'

  def index
    @rssfeeds = Rssfeed.all
  end

  def show
    @rssfeed = Rssfeed.find(params[:id])
  end

  def new
  end

  def create
  @rssfeed = Rssfeed.new(rssfeed_params)

  if @rssfeed.save
    # si le flux est ok, on cree de suite les items qui le composent
    create_items
    redirect_to @rssfeed
  else
    render 'new'
  end
end

def destroy
  @rssfeed = Rssfeed.find(params[:id])
  @rssfeed.destroy

  redirect_to rssfeeds_path
end

private
  def rssfeed_params
    params.require(:rssfeed).permit(:title, :feedurl)
  end

  def create_items
    url = @rssfeed.feedurl
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |elem|
        @item = Item.new(title: elem.title, summary: elem.description,
                         date: elem.date, url: elem.link, rssfeed_id: @rssfeed.id)
        @item.save
      end
    end
  end
end
