class UrlsController < ApplicationController


  def index
    @url = Url.new  #creates new object for _form to be able to loop through
    @urls = Url.all
  end

  def create
    @url = Url.new(params.require(:url).permit(:original_url)) #CREATES url OBJECT, cfrom sumbit usinf STRONG parmam
    @url.new_url = SecureRandom.urlsafe_base64(8)

    if @url.original_url.include? "https://" || "http://"
      redirect_to @url.original_url
    else
      @url.original_url = "https://#{@url.original_url}"
    end

    if @url.save!
        redirect_to root_path
    end

  end

  def show
    @url = Url.find_by(new_url: params[:new_url])
    redirect_to @url.original_url
  end
end
