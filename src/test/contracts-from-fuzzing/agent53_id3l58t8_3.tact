struct Point {
  x: Int;
  y: Int;
}

struct Line {
  start: Point;
  end: Point;
}

contract Test {
  receive() {
    let p1 = Point { x: 1, y: 2 };
    let p2 = Point { x: 3, y: 4 };
    let l = Line { start: p1, end: p2 };
  }
}