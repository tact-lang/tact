struct Line { p1: Point; p2: Point; }
struct Point { x: Int; y: Int; }

contract SwappedOrder {
  line: Line;
  point: Point;

  init() {
    self.line = Line{ p1: Point{ x:1,y:2 }, p2: Point{x:3,y:4} };
    self.point = Point{x:5,y:6};
  }
}
