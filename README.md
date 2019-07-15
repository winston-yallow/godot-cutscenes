# Godot Cutscenes
A small but effective cutscene addon for the godot game engine

## Concept
The Cutscene is basically an autoload that is always available. When a cutscene is played the scene tree gets paused. 
The provided cutscene will be added as a child to the cutscene autoload. The cutscene autload itselt has it's `pause_mode` 
set to `Node.PAUSE_MODE_PROCESS`. This way the cutscene is playing while the main scene is paused.

## Setup
Just copy the two files `Cutscene.tscn` and `Cutscene.gd` into your project. Then add the scene file as an autoload 
in the project settings. That's all you need to do.

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

### `Cutscene.pause()`
This pauses the cutscene. Attention! If you pause your cutscene, you wont be able to resume it from within
your cutscene (as it is paused). You may want to set a `pause_mode` in your cutscene to `process` to be able to unpause.

### `Cutscene.resume()`
Resume playing the cutscene.

### `Cutscene.toggle_pause()`
This toggles the pause/resume of the cutscene. The same warning as for `Cutscene.pause()` applies here.

### `Cutscene.stop()`
Stops the cutscene and resumes the scene that was active before the cutscene was started.

## Properties

### `Cutscene.is_playing`
Indicates if the cutscene is playing or paused

### `Cutscene.cutscene`
The currently active Cutscene. If no cutscene is active this is `null`.

## Additional Information
I seperated this from an addon I wrote for my space game project. It should work on it's own but I didn't test. If it 
does not work please open an issue.
