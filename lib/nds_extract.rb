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
    movie_gross = collection[movie_no][:worldwide_gross]
    if !studio_grosses[studio_key] 
      studio_grosses[studio_key] = movie_gross
    else 
      studio_grosses[studio_key] += movie_gross
    end
    movie_no += 1
  end
  studio_grosses
end

def movies_with_directors_set(source)
  dir_no = 0
  all_movies_by_dir = []
  while dir_no < source.length do
    dir_name = source[dir_no][:name]
    dir_movies = source[dir_no][:movies]
    all_movies_by_dir << movies_with_director_key(dir_name, dir_movies)
    dir_no += 1
  end
  all_movies_by_dir
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
