struct Point {
  x: Int;
  y: Int;
}

message Move {
  delta: Point;
}

contract Test {
  receive() {}
}