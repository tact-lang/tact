struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Shape {
  p1: Point;
  p2: Point;
  p3: Point;
}

contract TestContract {
  shape: Shape;

  init() {
    self.shape = Shape{
      p1: Point{ x:1, y:2 },
      p2: Point{ x:3, y:4 },
      p3: Point{ x:5, y:6 },
    };
  }
}