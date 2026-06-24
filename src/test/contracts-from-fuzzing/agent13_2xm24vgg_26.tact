message Point {
  x: Int;
  y: Int;
}

message Circle {
  center: Point;
  radius: Int;
}

contract Test {
  receive() {
    Circle{center: Point{x:1,y:2}, radius:5};
  }
}