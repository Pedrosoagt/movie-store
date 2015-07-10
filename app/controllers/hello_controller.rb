# HelloController
class HelloController < ApplicationController
  def index
    @name = params[:name].nil? ? 'PAC' : params[:name]
  end
end
