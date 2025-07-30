message Point {
  x: Int;
  y: Int;
}

message Circle {
  center: Point;
  radius: Int;
}

contract Test {
  receive(msg: Circle) {
    let d = msg.radius;
    let px = msg.center.x;
  }
}