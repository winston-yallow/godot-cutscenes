extends Control

var is_playing = false

var prev_pause_state: bool
var cutscene = null

onready var viewport: Viewport = $ViewportContainer/Viewport

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    visible = false
    viewport.pause_mode = Node.PAUSE_MODE_STOP
    # warning-ignore:return_value_discarded
    connect("resized", self, "adjust_sizes")
    adjust_sizes()

func adjust_sizes():
    viewport.size.x = rect_size.x
    viewport.size.y = rect_size.y

func play(scene: Node):
    
    prev_pause_state = get_tree().paused
    
    get_tree().current_scene.visible = false
    get_tree().paused = true
    
    visible = true
    viewport.pause_mode = Node.PAUSE_MODE_PROCESS
    viewport.add_child(scene)
    
    is_playing = true
    cutscene = scene

func pause():
    viewport.pause_mode = Node.PAUSE_MODE_STOP
    is_playing = false

func resume():
    viewport.pause_mode = Node.PAUSE_MODE_PROCESS
    is_playing = true

func toggle_pause():
    if is_playing:
        pause()
    else:
        resume()

func stop():
    
    get_tree().current_scene.visible = true
    get_tree().paused = prev_pause_state
    
    visible = false
    viewport.pause_mode = Node.PAUSE_MODE_STOP
    
    cutscene.queue_free()
    cutscene = null
    
    is_playing = false
