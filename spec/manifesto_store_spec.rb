require 'spec_helper'

describe ManifestoStore do

  before(:each) do
    ManifestoStore.delete_all    
  end

  it "deveria salvar Manifestos" do
    ManifestoStore.save!('a', 'e1', 'd1', 'e2' , 'd2', 'e3', 'd3', 'e4', 'd4').should eql(1)
  end

  it "deveria não permitir slugs duplicados" do
    ManifestoStore.save!('a', 'e1', 'd1', 'e2' , 'd2', 'e3', 'd3', 'e4', 'd4')
    lambda {ManifestoStore.save!('a', 'e1', 'd1', 'e2' , 'd2', 'e3', 'd3', 'e4', 'd4')}.should raise_error('Esse slug já existe')
  end

  it "deveria restaurar Manifestos pelo slug" do
    ManifestoStore.save!('a', 'e1', 'd1', 'e2' , 'd2', 'e3', 'd3', 'e4', 'd4')
    ManifestoStore.find('a')['esquerda1'].should eql('e1')
  end

  it "deve retornar nil caso não encontrado" do
    pending
  end

  after(:each) do
    ManifestoStore.delete_all    
  end

end

