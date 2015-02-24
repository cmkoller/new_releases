require 'sinatra'
require 'csv'
require 'pry'

def read_albums_from(csv)
  # Desired output:
  # { "1989" => {name: "1989", artists: ""}, "album_name" => { ... } }
  albums = {}

  CSV.foreach(csv, headers: true) do |row|
    album_info = row.to_hash
    albums[album_info["name"]] = album_info
  end

  albums
end

get '/albums' do
  albums = read_albums_from('albums.csv')

  erb :'/albums/index', locals: {albums: albums}
end

get '/albums/:album_name' do
  albums = read_albums_from('albums.csv')
  album_info = albums[params[:album_name]]

  erb :'/albums/show', locals: {album_info: album_info}
end
