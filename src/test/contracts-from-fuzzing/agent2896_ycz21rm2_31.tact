contract NestedDestructuring {
  a: Int;
  b: Point;

  init() {
    let Point { x, y } = Point{ x:1, y:2 };
    self.a = x + y;
    self.b = Point { x:x, y:y };
  }
}

struct Point {
  x: Int;
  y: Int;
}
