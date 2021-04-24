extends Control


var is_playing = false
var cutscene = null

var _prev_pause_state: bool

onready var _viewport: Viewport = $ViewportContainer/Viewport


func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    visible = false
    _viewport.pause_mode = Node.PAUSE_MODE_STOP
    # warning-ignore:return_value_discarded
    connect("resized", self, "_adjust_sizes")
    _adjust_sizes()


func play(scene: Node):
    
    _prev_pause_state = get_tree().paused
    
    get_tree().current_scene.visible = false
    get_tree().paused = true
    
    visible = true
    _viewport.pause_mode = Node.PAUSE_MODE_PROCESS
    _viewport.add_child(scene)
    
    is_playing = true
    cutscene = scene


func pause():
    _viewport.pause_mode = Node.PAUSE_MODE_STOP
    is_playing = false


func resume():
    _viewport.pause_mode = Node.PAUSE_MODE_PROCESS
    is_playing = true


func toggle_pause():
    if is_playing:
        pause()
    else:
        resume()


func stop():
    
    get_tree().current_scene.visible = true
    get_tree().paused = _prev_pause_state
    
    visible = false
    _viewport.pause_mode = Node.PAUSE_MODE_STOP
    
    cutscene.queue_free()
    cutscene = null
    
    is_playing = false


func _adjust_sizes():
    _viewport.size.x = rect_size.x
    _viewport.size.y = rect_size.y
