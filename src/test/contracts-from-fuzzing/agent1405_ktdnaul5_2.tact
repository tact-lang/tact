struct Point {
  x: Int;
  y: Int;
}

contract StructFieldNested {
  myPoint: Point;

  init() {
    self.myPoint = Point{ x: 1, y: 2 };
  }
}