struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Line {
  start: Point;
  end: Point;
}

contract Geometry {
  line: Line;

  init() {
    self.line = Line{
      start: Point{ x: -100, y: -100 },
      end: Point{ x: 100, y: 100 }
    };
  }
}