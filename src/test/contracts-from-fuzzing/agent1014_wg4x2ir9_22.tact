struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Annotated {
  p1: Point;
  p2: Point;
}

contract Test {
  a: Annotated = Annotated{ p1: Point{ x: 1, y: 2 }, p2: Point{ x: 3, y: 4 } };
}
