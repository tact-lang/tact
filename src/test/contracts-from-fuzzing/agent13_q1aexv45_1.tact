struct Nested {
  point: Point;
}

struct Point {
  x: Int;
  y: Int;
}

contract Test {
  pos: Nested;

  init() {
    self.pos = Nested{point: Point{x:1,y:2}};
  }
}