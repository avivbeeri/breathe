import "graphics" for Canvas, Color
import "input" for Keyboard
import "dome" for Window
import "math" for Vec, M

var CENTER
var DIM

class Game {
    static init() {
      Canvas.resize(256, 256)
      Window.title = "Breathe"
      var scale = 3
      Window.resize(scale * Canvas.width, scale * Canvas.height)
      CENTER = Vec.new(Canvas.width / 2, Canvas.height / 2)
      DIM = Canvas.width * 0.75
      __radius = 5
      __acc = 0
      __vel = 0
      __displayText = true
    }
    static update() {
      if (Keyboard.isKeyDown("space")) {
        __displayText = false
        __acc = 1
      } else {
        if (__radius > 3) {
          __acc = -1
        } else {
          __acc = 0
        }
      }
      __vel = M.mid(-5, __vel + __acc, 5) / 3
      __radius = M.mid(2, __radius + __vel, DIM / 2)
    }
    static draw(dt) {
      Canvas.cls(Color.white)
      var radius = __radius
      var min = M.max(0, radius - 3)
      Canvas.circlefill(CENTER.x, CENTER.y, radius, Color.black)
      Canvas.circlefill(CENTER.x, CENTER.y, min, Color.white)

      if (__displayText) {
        Canvas.print("Hold the SPACE bar...", Canvas.width / 2 - (21 * 4), Canvas.height - 16, Color.black)

      }
    }
}
