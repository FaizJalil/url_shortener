class UrlsController < ApplicationController
  def index #this is the home page. Display all items in database here
    @urls = Url.all
  end

  def show #show the desired long url and shortened url
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    byebug
    @url = Url.new(url_params)
    @url.shorten
    if @url.save
      redirect_to @url
    else
      render 'new'
    end
  end


  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  def short
    url = Url.find(params[:id])
    redirect_to url.long_url
  end


    private
    def url_params
      params.require(:url).permit(:long_url)
    end
end
