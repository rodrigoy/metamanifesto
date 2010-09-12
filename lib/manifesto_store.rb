require 'uri'
require 'mongo'

class ManifestoStore
  
  url = ENV['MONGOHQ_URL']
  uri = URI.parse(url)
  conn = url.match('localhost') ? Mongo::Connection.new(uri.host, uri.port) : Mongo::Connection.from_uri(url)
  db = conn.db(uri.path.gsub(/^\//, ''))
  @collection = db.collection('Manifestos')

  def self.save!(slug, 
    esquerda1, direita1, 
    esquerda2, direita2, 
    esquerda3, direita3,
    esquerda4, direita4)

    raise 'Esse slug já existe' if find slug

    @collection.insert({:_id => next_id,
      :slug => slug,
      :esquerda1 => esquerda1, :direita1 => direita1,
      :esquerda2 => esquerda2, :direita2 => direita2, 
      :esquerda3 => esquerda3, :direita3 => direita3,
      :esquerda4 => esquerda4, :direita4 => direita4})
  end
  
  def self.find(slug)
    @collection.find_one({'slug'=> slug})
  end

  def self.delete_all
    @collection.drop
  end

  protected

  def self.next_id
    cursor = @collection.find().sort(['_id', 'descending']).limit(1)
    next_id = cursor.has_next? ? cursor.next_document['_id'] + 1 : 1
  end

end
