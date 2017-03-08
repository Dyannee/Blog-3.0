class HomepageController < ApplicationController
  def index
    @albums = Album.all
  end
end
