require 'rubygems'
require 'sinatra'
require 'erb'
require 'uri'

set :views, File.dirname(__FILE__) + '/views'

get '/' do
  erb :index
end

