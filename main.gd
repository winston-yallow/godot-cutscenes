tool
extends EditorPlugin

func _enter_tree():
    add_autoload_singleton("CUTSCENE", "res://addons/cutter/Cutscene.tscn")

func _exit_tree():
    remove_autoload_singleton("CUTSCENE")
