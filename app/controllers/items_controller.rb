class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @status = false # false pour non-lu, true pour lu - n'a aucun effet ici
    # @item.save # ne fonctionne pas ici mais ok dans RssfeedsController (?)
  end

  def update # cette methode n'est pas appelee
    # methode pour mettre a jour le statut (non-lu / lu)
    @item = Item.find(params[:id])
    #puts 'HELLO JE SUIS LAAAAAAAAAAAAAAAAAA' #debug
    #@item.update(title: "Pierre Tchernia est vivant") #debug
    if @item.status
      @item.update(status: 0)
      puts non-lu #debug
    else
      @item.update(status: 1)
      puts lu #debug
    end
    @item.save
    redirect_to @rssfeeds
    #if @item.update(status: !@item.status)
    #  redirect_to @item
    #else
    #  render 'show'
    #end
  end

end
