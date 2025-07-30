struct Point {
  x: Int as int64;
  y: Int as int64;
}

contract SerializedFields {
  pos: Point;

  init() {
    self.pos = Point{ x: 123, y: 456 };
  }
}