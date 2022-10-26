require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do 
include Rack::Test:: Methods

let(:app) { Application.new}

context 'GET /' do
    it 'returns 200 OK' do
        response = get('/')
        expect(response.status).to be(200)
    end 
end 

context 'GET /names' do
    it 'returns a list of names and a 200 OK status' do
        response = get('/names?name=Julia, Mary, Karim')
        expect(response.status).to eq(200)
        expect(response.body).to eq("Julia, Mary, Karim")
    end 
end 

context '/POST /sort-names' do
    it 'returns the correct body' do
        response = post('/sort-names', name: 'Joe, Kieran, Alice, Julia, Zoe')
        expect(response.body).to eq('Alice, Joe, Julia, Kieran, Zoe')
        expect(response.status).to eq(200)
    end 
end 

end 