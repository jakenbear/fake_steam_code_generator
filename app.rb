require 'sinatra/base'
require './codes.rb'
require 'yaml/store'
require 'clipboard'
require 'securerandom'
#Welcome
module Storeapp
  class Web < Sinatra::Base

    #STORE APP CODE - HOME
    get '/' do
      @title = 'Fake Steam Code Key Generator'
      @quantity = params[:howmany].nil? ? 1 : params[:howmany]
      erb :index
    end

    #PRODUCTS DISPLAY
    post '/codes' do
      @title = 'Generated Keys'
      @quantity = params[:howmany].to_i
      @code = Codes.new(@quantity)
      @get_codes = @code.gen_codes
      erb :codes
    end

  end
end
