struct Point {
  a: Int;
  b: Int;
}

struct Line {
  start: Point;
  end: Point;
}

struct Square {
  top: Line;
  bottom: Line;
}

contract ShapeStore {
  shape: Square;

  init() {
    self.shape = Square{
      top: Line{start: Point{a:1,b:2}, end: Point{a:3,b:4}},
      bottom: Line{start: Point{a:5,b:6}, end: Point{a:7,b:8}}
    };
  }
}