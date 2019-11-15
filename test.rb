require 'cryptoexchange'

client = Cryptoexchange::Client.new
pairs = client.pairs('bitflyer')