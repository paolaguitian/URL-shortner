class UrlsController < ApplicationController


  def index
    @url = Url.new  #creates new object for _form to be able to loop through
    @urls = Url.all
  end

  def create
    #create saves og url coming in from sumbit params, also creates randomized
    #new url then verifies urls have http if not prepends it, then saves
    @url = Url.new(params.require(:url).permit(:original_url)) #CREATES url OBJECT, cfrom sumbit usinf STRONG parmam
    @url.new_url = SecureRandom.urlsafe_base64(8)

    if @url.original_url.include?("https://") || @url.original_url.include?("http://")
      redirect_and_save

    else
      @url.original_url = "https://#{@url.original_url}"
       redirect_and_save
    end
  end

  def show
    #finds desired object via new url being passed in from route path saved into url
    @url = Url.find(params[:new_url])
    redirect_to @url.original_url #redirects to the og url from the object found above
  end

  def redirect_and_save  #DRYS CODE
    @url.save!
    redirect_to root_path
  end


end
