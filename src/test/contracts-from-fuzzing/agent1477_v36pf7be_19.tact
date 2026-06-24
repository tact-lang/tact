struct Point {
  x: Int as int8; y: Int as int8;
}

struct Rectangle {
  p1: Point;
  p2: Point;
}

contract Geometry {
  r: Rectangle;

  init() {
    self.r = Rectangle{p1: Point{x:1,y:2}, p2: Point{x:3,y:4}};
  }
}