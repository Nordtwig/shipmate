extends Control


func _ready() -> void:
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request("https://api.github.com/repos/godotengine/godot/releases/latest")


func _on_request_completed(result: int , response_code: int, headers: PackedStringArray, body: PackedByteArray):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print("Request completed")
	print(json["name"])