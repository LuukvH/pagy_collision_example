# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ItemsController', type: :request do
  describe 'GET /items' do
    it 'returns a successful response' do
      get '/items'
      expect(response).to have_http_status(:success)
    end

    it 'returns 50 items' do
      get '/items'
      json_response = JSON.parse(response.body)
      expect(json_response['data'].size).to eq(50)
    end

    it 'each item has a uuid and name' do
      get '/items'
      json_response = JSON.parse(response.body)
      json_response['data'].each do |item|
        expect(item).to have_key('uuid')
        expect(item).to have_key('name')
      end
    end
  end
end
