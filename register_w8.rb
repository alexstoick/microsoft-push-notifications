require 'uri'
require 'net/http'
require 'addressable/uri'

uri = URI.parse('http://login.live.com/accesstoken.srf')

client_secret = 'BMhGH8cZHnCFld/eSXbLUM0OgyM5j7fg'
client_id = 'ms-app://s-1-15-2-1797635052-2109252229-1923475047-795285239-1751804332-2552448177-812750004'

params = {  :grant_type => "client_credentials" ,
			:client_id => client_id ,
			:client_secret => client_secret
			:scope => "notify.windows.com"
		}

u.query = URI.encode_www_form( params )

puts u
puts u.query

req = Net::HTTP::Post.new(u)
req.set_form_data ( params )

req.content_type = 'application/x-www-form-urlencoded'


resp = Net::HTTP.start(u.host, u.port) do |http|
	http.request(req)
end

puts resp

