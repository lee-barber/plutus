class MainController < ApplicationController
  def index
  	# instance variables:
  	# API URL
  	require 'net/http'
  	require 'json'

  	@url = 'https://api.coinmarketcap.com/v1/ticker/'
  	# call the URI class and input the given URL
  	@uri = URI(@url)
  	# go to the given API website via http
  	@response =  Net::HTTP.get(@uri)
  	# parse the API result with JSON and place it inside the "coins" variable
  	@coins = JSON.parse(@response)
  	@wallet = ["BTC", "ETH", "XRP", "BCH", "LTC", "EOS", "XLM", "ADA", "NEO"]

  end

  def about
  end

  def search

    # instance variables:
    # API URL
    require 'net/http'
    require 'json'

    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    # call the URI class and input the given URL
    @uri = URI(@url)
    # go to the given API website via http
    @response =  Net::HTTP.get(@uri)
    # parse the API result with JSON and place it inside the "coins" variable
    @search_coin = JSON.parse(@response)

    @symbol = params[:crypto]

    # convert user search input to uppercase on return to prevent currency mixups
    if @symbol
      @symbol = @symbol.upcase
    end

    # if user doesn't enter search phrase, return error
    if @symbol == ""
      @symbol = "Please enter a search value."
    end

    # if cryptocurrency does not exist, return error
    # if @symbol == 
    #   @symbol = "This cryptocurrency does not exist."

  end

end