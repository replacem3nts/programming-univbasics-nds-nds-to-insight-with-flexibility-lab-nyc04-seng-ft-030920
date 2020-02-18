# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
require 'pp'

def movies_with_director_key(name, movies_collection)
  mov_no = 0
  ds_mov_array = []
  while mov_no < movies_collection.length do
    d_name = movie_with_director_name(name, movies_collection[mov_no])
    ds_mov_array << d_name
    mov_no += 1
  end
  ds_mov_array
end


def gross_per_studio(collection)
  movie_no = 0
  studio_grosses = {}
  while movie_no < collection.length do
    studio_key = collection[movie_no][:studio]
    if studio_grosses.has_key?(studio_key) {
      studio_grosses[studio_key] += collection[movie_no][:worldwide_gross]
    }
    else {
      studio_grosses[studio_key] => collection[movie_no][:worldwide_gross]
    }
    end
    movie_no += 1
  end
  studio_grosses
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)
  d_no = 0
  all_movies_by_d = []
  while d_no < source.length do
    all_movies_by_d << source[d_no][:movies]
    d_no += 1
  end
all_movies_by_d
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
