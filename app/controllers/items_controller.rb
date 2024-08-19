class ItemsController < ApplicationController
  include Pagy::Backend

  def index
    @items = Array.new(50) do |i|
      { uuid: SecureRandom.uuid, name: "Item #{i + 1}" }
    end

    @pagy, @records = pagy_array(@items)

    pagy_headers_merge(@pagy)

    render json: { data: @records }
  end
end
