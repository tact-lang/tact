struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Line {
  start: Point;
  end: Point;
}

contract GeometryStore {
  line: Line = Line{
    start: Point{
      x: 1,
      y: 2,
    },
    end: Point{
      x: 3,
      y: 4,
    },
  };

  init() {
    self.line = Line{
      start: Point{ x: 10, y: 20 },
      end: Point{ x: 30, y: 40 },
    };
  }
}
