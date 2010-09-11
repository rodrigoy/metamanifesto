require 'spec_helper'

set :environment, :test

describe 'nao sei ainda o que' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "deveria entrar na index" do
    get '/'
    last_response.should be_ok
    #last_response.body.should == 'vamos nessa rodrigoy'
  end
end
