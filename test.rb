require 'ruby-mpns'

puts "=== Sample Usage ==="

uri = "https://db3.notify.windows.com/?token=AgYAAABSI4RInMRaXKObnyg%2fuP3xjDmMW5gluk3HgD0vD%2bSx2yC3awKAyuEc3OA9nZ55N7ZgE0kiPgW5%2farR%2fre7t9YjhOKl2cLa%2fNY%2bZdG9NM3TLx1BfcRltsUPEV0HzzTuiNI%3d"

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