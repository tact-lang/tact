struct Point {
  x: Int = 1;
  y: Int = 2;
}

struct Line {
  start: Point = Point{ x: 10, y: 20 };
  end: Point;
}

contract StructDefaultInline {
  l: Line;

  init() {
    self.l = Line{
      start: Point{ x: 11, y: 22 },
      end: Point{ x: 33, y: 44 }
    };
  }
}
