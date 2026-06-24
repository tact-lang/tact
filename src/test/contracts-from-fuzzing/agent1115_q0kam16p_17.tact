struct Point { x: Int; y: Int; }
struct Circle { center: Point; radius: Int; }
struct Scene { c1: Circle; c2: Circle; }

contract Geometry {
  scene: Scene;

  init() {
    self.scene = Scene{
      c1: Circle{ center: Point{ x:0, y:0 }, radius: 10 },
      c2: Circle{ center: Point{ x:5, y:5 }, radius: 20 }
    };
  }
}