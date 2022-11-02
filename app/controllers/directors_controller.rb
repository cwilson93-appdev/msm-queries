class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all

    render({ :template => "directors_template/index.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc}).at(0)

    render({ :template => "directors_template/eldest.html.erb"})
  end

  def dumbest
    @youngest = Director.order({ :dob => :desc}).at(0)

    render({ :template => "directors_template/youngest.html.erb"})
  end

  def director_details
    the_id = params.fetch("an_id")
    @the_director = Director.where({ :id => the_id}).at(0)
    @filmography = Movie.where({ :director_id => @the_director.id })

    render({ :template => "directors_template/show.html.erb"})
  end



end
