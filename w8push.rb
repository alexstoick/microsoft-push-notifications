require 'uri'
require 'net/http'

# 'authorization' => 'Bearer EgAaAQMAAAAEgAAACoAAyDC5rPTYWv8YFYbzwt/JTbieZG0Ztg+23/RVzeNKgdfmI0NtsPN78rp2BHB3SUUQOIB/jQFNcTNueJagwNlJDUsql+AyENc+p2E0gkMwFb0IV5Ule6AzaI9SglYafDJEXgsPX3cbI+Z9XnyPQqqLQCdvzU5dae/uscH/uI8brRqJAFoAiQAAAAAAyPgPSJED+FGRA/hR60gEAAwAODYuMTIxLjAuMjkAAAAAAF0AbXMtYXBwOi8vcy0xLTE1LTItMTc5NzYzNTA1Mi0yMTA5MjUyMjI5LTE5MjM0NzUwNDctNzk1Mjg1MjM5LTE3NTE4MDQzMzItMjU1MjQ0ODE3Ny04MTI3NTAwMDQA' ,
# 'X-WNS-RequestForStatus' => 'true',
# 'X-WNS-Type' => 'wns/toast',
# 'Content-Type' => 'text/xml',
# 'Host' => 'db3.notify.windows.com',
# 'Content-Length' => 1

uri = URI.parse( 'https://db3.notify.windows.com/?token=AgYAAAC9lswWOWfnKIBnnjicdgi54ra1igYP4I%2fwL68DTj1LYQYICwcHKl5bYNSYQ6JQOfDNaWcFX9Ra0%2bmZgizcC1UWKnWZnqGejwFn8qFY3jKY7LMJPCJBMwimSlq2tr64e8A%3d' )

link = 'https://db3.notify.windows.com/?token=AgYAAAC9lswWOWfnKIBnnjicdgi54ra1igYP4I%2fwL68DTj1LYQYICwcHKl5bYNSYQ6JQOfDNaWcFX9Ra0%2bmZgizcC1UWKnWZnqGejwFn8qFY3jKY7LMJPCJBMwimSlq2tr64e8A%3d'

https = Net::HTTP.new(uri.host,uri.port)
https.use_ssl = true

https.verify_mode = OpenSSL::SSL::VERIFY_NONE
https.set_debug_output $stderr


puts uri.host
puts uri.port

# req = https::Post.new ( uri )

# req.body = "da fucking content"

# req["Host"] = uri.host
# req["Content-Length"] = 1
# req["X-WNS-Type"] = 'wns/toast'
# req["X-WNS-RequestForStatus"] = 'true'

# res = https.start(u.host, u.port) do |http|
# 	http.request(req)
# end

# res.each_header do |header_name, header_value|
#   puts "#{header_name}: #{header_value}"
# end

#"token" => "AgYAAAC9lswWOWfnKIBnnjicdgi54ra1igYP4I%2fwL68DTj1LYQYICwcHKl5bYNSYQ6JQOfDNaWcFX9Ra0%2bmZgizcC1UWKnWZnqGejwFn8qFY3jKY7LMJPCJBMwimSlq2tr64e8A%3d"

puts uri.path + uri.query
req, body = https.post( link , '<toast launch="">
  <visual lang="en-US">
    <binding template="ToastImageAndText01">
      <image id="1" src="http://images.wisegeek.com/young-calico-cat.jpg" />
      <text id="1">Hello madafacar</text>
    </binding>
  </visual>
</toast>',
{
	"Authorization" => "Bearer EgAaAQMAAAAEgAAACoAAyDC5rPTYWv8YFYbzwt/JTbieZG0Ztg+23/RVzeNKgdfmI0NtsPN78rp2BHB3SUUQOIB/jQFNcTNueJagwNlJDUsql+AyENc+p2E0gkMwFb0IV5Ule6AzaI9SglYafDJEXgsPX3cbI+Z9XnyPQqqLQCdvzU5dae/uscH/uI8brRqJAFoAiQAAAAAAyPgPSJED+FGRA/hR60gEAAwAODYuMTIxLjAuMjkAAAAAAF0AbXMtYXBwOi8vcy0xLTE1LTItMTc5NzYzNTA1Mi0yMTA5MjUyMjI5LTE5MjM0NzUwNDctNzk1Mjg1MjM5LTE3NTE4MDQzMzItMjU1MjQ0ODE3Ny04MTI3NTAwMDQA" ,
	'X-WNS-RequestForStatus' => 'true',
	'X-WNS-Type' => 'wns/toast',
	'Content-Type' => 'text/xml',
	'Host' => 'db3.notify.windows.com',
	'Content-Length' => '1'
})
req.each{ |h,v| puts "#{h}: #{v}" }