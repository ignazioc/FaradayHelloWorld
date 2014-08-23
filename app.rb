require 'faraday'
require 'faraday_middleware'

str = ARGV.length > 0 ? ARGV[0] : 'Berlin'


request = Faraday.new do |builder|
  builder.use Faraday::Adapter::NetHttp #default adapter for Net::HTTP
  builder.use FaradayMiddleware::ParseJson #cool for parsing response bodies
 end

response = request.get 'http://api.openweathermap.org/data/2.5/weather/', :q => str

temp = response.body['main']['temp'].to_f - 272.15

printf "Temp in #{str} is: %.1f\n", temp