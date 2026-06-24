struct Point {
  x: Int;
  y: Int;
}

contract Test {
  receive() {
    let point: Point = Point{x: 1, y: 2};
  }
}