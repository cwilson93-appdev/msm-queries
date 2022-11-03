class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all

    render({ :template => "actors_template/index.html.erb"})
  end

  def actor_details
    the_id = params.fetch("an_id")
    @the_actor = Actor.where({ :id => the_id}).at(0)
    @filmography = Movie.where({ :actor_id => @the_actor.id })
    render({ :template => "actors_template/show.html.erb"})
  end

end
