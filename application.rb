require 'rubygems'
require 'sinatra'
require 'erb'
require 'uri'

set :views, File.dirname(__FILE__) + '/views'

get '/' do
  erb :index
end

post '/manifesto' do
  redirect '/manifesto/titulo'
end

get '/manifesto/:slug' do
  erb :manifesto
end
