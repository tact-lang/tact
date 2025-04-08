struct Point {
  x: Int as int64;
  y: Int as int64;
}

contract CoordPacked {
  coord: Point;

  init() {
    self.coord = Point{x: 1, y: 2};
  }

  receive() {
    let _ = self.coord.x + self.coord.y;
  }
}