require 'httparty'

order_currency = 'BTC'
payment_currency = 'KRW'

address = "https://api.bithumb.com/public/ticker/#{order_currency}_#{payment_currency}"
response = HTTParty.get(address)
data = response.parsed_response
puts data["data"]["closing_price"]