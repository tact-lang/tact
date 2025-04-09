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
    let p: Point = Point{ x: 1, y: 2 };
  }
}