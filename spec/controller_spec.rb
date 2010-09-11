require 'spec_helper'

set :environment, :test

describe 'nao sei ainda o que' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'salvando o manifesto' do
    it 'deveria salvar os 4 itens do manifesto' do
      post '/manifesto', :titulo => 'titulo',
      :esquerda1 => 'esquerda1',
      :direita1 => 'direita1',
      :esquerda2 => 'esquerda2',
      :direita1 => 'direita2',
      :esquerda3 => 'esquerda3',
      :direita3 => 'direita3',
      :esquerda4 => 'esquerda4',
      :direita4 => 'direita4'

      #follow_redirect!
      
      last_response.headers["location"].should == "/manifesto/titulo"

      get '/manifesto/titulo'
      
      last_response.body.should include "esquerda1"
      last_response.body.should include "direita1"
      last_response.body.should include "esquerda2"
      last_response.body.should include "direita2"
      last_response.body.should include "esquerda3"
      last_response.body.should include "direita3"
      last_response.body.should include "esquerda4"
      last_response.body.should include "direita4"
    end
  end
end
