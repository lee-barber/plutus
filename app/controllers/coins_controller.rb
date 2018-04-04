class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  # tells the app to confirm the user is signed in before allowing coin actions
  before_action :authenticate_user!
  # defines what a "correct user" is allowed to do (correct user method is defined at the bottom of this controller)
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.all
    require 'net/http'
    require 'json'

    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=2000'
    # call the URI class and input the given URL
    @uri = URI(@url)
    # go to the given API website via http
    @response =  Net::HTTP.get(@uri)
    # parse the API result with JSON and place it inside the "coins" variable
    @search_coin_data = JSON.parse(@response)
    @profit_loss = 0
    @total_invest = 0
    @total_value = 0
  end


  # GET /coins/1
  # GET /coins/1.json
  def show
    @coins = Coin.all
    require 'net/http'
    require 'json'

    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=2000'
    # call the URI class and input the given URL
    @uri = URI(@url)
    # go to the given API website via http
    @response =  Net::HTTP.get(@uri)
    # parse the API result with JSON and place it inside the "coins" variable
    @show_my_coin = JSON.parse(@response)
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: 'Coin was successfully added.' }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: 'Coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.destroy
    respond_to do |format|
      format.html { redirect_to coins_url, notice: 'Coin was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_params
      params.require(:coin).permit(:symbol, :user_id, :cost_per, :amount_owned, :purchased_on)
    end

# custom method not written by rails
    def correct_user
      @correct = current_user.coins.find_by(id: params[:id])
      redirect_to coins_path, notice: "Stay in your own wallet, please." if @correct.nil?
    end
end
