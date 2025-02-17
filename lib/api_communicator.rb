require 'rest-client'
require 'json'
require 'pry'

def star_wars_info(input_url)
  response_string = RestClient.get(input_url)
  response_hash = JSON.parse(response_string)
  return response_hash
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = star_wars_info('http://www.swapi.co/api/people/')

  response_hash["results"].each do |info|
    if info["name"].downcase == character_name.downcase
        films = info["films"]
      return films
    else
      return "There has been a disturbance in the Force."
    end
  end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end



def print_movies(films)

  puts films
  #
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
