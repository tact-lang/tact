struct Point {
  x: Int;
  y: Int;
}

message Move {
  point: Point;
}

contract Test {
  receive(message: Move) {
    return;
  }
}