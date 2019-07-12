# Godot Cutscenes
A small but effective cutscene addon for the godot game engine

## Setup
Just copy the two file `Cutscene.tscn` and `Cutscene.gd` into your project. Then add the scene file as an autoload in the project settings. That's all you need to do.

## Methods

### `Cutscene.play(scene: Node)`
This pauses the current scene and displays the cutscene.  
Arguments:
- `scene: Node`  
  The scene that should be played. Has to be an instance of Node.  
  Example:  
  ```gdscript
  var scene = load("res://path/to/scene.tscn")
  Cutscene.play(scene.instance())
  ```

## Additional Information
I seperated this from a addon I wrote for my space game project. It should work on it's own but I didn't test. If it does not work please open an issue.
