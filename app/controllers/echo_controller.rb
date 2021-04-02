class EchoController < ApplicationController
  include Wisper::Publisher

  def index
    broadcast(:echo, params[:name] || 'world')
    render json: params
  end
end