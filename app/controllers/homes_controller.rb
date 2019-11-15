class HomesController < ApplicationController
  def index
    order_currency = 'BTC'
    payment_currency = 'KRW'
    
    address = "https://api.bithumb.com/public/ticker/#{order_currency}_#{payment_currency}"
    response = HTTParty.get(address)
    @data = response.parsed_response["data"]
    @closing_price = @data["closing_price"]
  end

  def second
    order_currency = params[:currency_name].upcase
    payment_currency = 'KRW'
    
    address = "https://api.bithumb.com/public/ticker/#{order_currency}_#{payment_currency}"
    response = HTTParty.get(address)
    @data = response.parsed_response["data"]
    
    if order_currency != 'ALL'
      @result = {order_currency => @data}
    else
      @result = @data
    end
  end

  def third
    address = "https://api.bithumb.com/public/ticker/ALL_KRW"
    response = HTTParty.get(address)
    @data = response.parsed_response["data"]
    
    max_fluc = {}
    @data.each do |cur|
      if cur[0] != "date"
        max_fluc.store(cur[0], cur[-1]['fluctate_rate_24H'].to_i)
      end
    end
    max_fluc = max_fluc.sort {|a1,a2| a2[1] <=> a1[1]}
    @max_fluc = max_fluc.first(5)
    
  end
end
