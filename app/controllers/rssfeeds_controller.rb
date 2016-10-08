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

private
  def rssfeed_params
    params.require(:rssfeed).permit(:title, :feedurl)
  end

  def create_items
    url = @rssfeed.feedurl
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |elem|
        # comment faire item = new Item(elem.title, elem.date, rssfeed.id, status = 0) ... ?
        #@item = Item.new
        #puts "Item: #{elem.title}"
      end
    end

end
