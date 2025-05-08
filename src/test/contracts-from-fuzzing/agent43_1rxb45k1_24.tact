struct Point {
  x: Int;
  y: Int;
}

contract Test {
  receive() {
    let s = Point{x: 1, y: 2};
    s.x = 5;
  }
}