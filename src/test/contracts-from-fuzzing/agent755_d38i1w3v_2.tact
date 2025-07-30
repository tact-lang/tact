struct Point {
  x: Int;
  y: Int;
  z: Int?;
}

contract OptNested {
  p: Point;

  init() {
    self.p = Point{ x: 11, y: 22, z: null };
  }
}