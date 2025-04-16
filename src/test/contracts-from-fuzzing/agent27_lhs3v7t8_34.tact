struct Point {
  x: Int;
  y: Int;
}

message Msg {
  p: Point;
}

contract Test {
  receive(m: Msg) {
    let xx = m.p.x;
  }
}