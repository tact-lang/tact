struct Point {
  x: Int;
  y: Int;
}

message Circle {
  center: Point;
  radius: Int;
}

message Scene {
  circle: Circle;
}

contract Test {
  receive(msg: Scene) {
    let r = msg.circle.radius;
  }
}