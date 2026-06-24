message Point {
  x: Int;
  y: Int;
}

contract Test {
  receive(msg: Point) {}
}