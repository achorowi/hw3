class PostsController < ApplicationController

  def show
    @post = Post.find_by({"name" => params["name"]})
    @place = Place.find_by({"name" => @post["place_id"]})
  end

  def new 
    @post = Post.new
    @place = Place.find_by({"name" => params ["place_id"]})
    @post["place_id"] = @place["name"]
  end

  def create
    @post = Post.new 
    @post["title"] = params["post"]["title"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["description"] = params["post"]["description"]
    @post["place_id"] = params["post"]["place_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end
