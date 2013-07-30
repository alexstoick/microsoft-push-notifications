require 'ruby-mpns'

puts "=== Sample Usage ==="

uri = "http://am3.notify.live.net/throttledthirdparty/01.00/AQGtyc6dqUY3Rpns6vi4x2qcAgAAAAADAQAAAAQUZm52OkJCMjg1QTg1QkZDMkUxREQFBkVVV0UwMQ"
#
# => TOAST
#
options = {
	title: "Hi there",
	content: "Testing <correct> encoding of special chars.",
	params: {
		invoice_id: 2,
		state: 10.5,
		another: '"hey hey"'
	}
}

response = MicrosoftPushNotificationService.send_notification uri, :toast, options
puts response