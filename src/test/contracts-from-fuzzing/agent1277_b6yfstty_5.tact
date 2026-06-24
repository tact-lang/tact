struct Point {
  x: Int;
  y: Int;
}

struct Circle {
  center: Point;
  radius: Int;
}

struct Rectangle {
  topLeft: Point;
  bottomRight: Point;
}

struct ComplexShape {
  circ: Circle;
  rect: Rectangle;
  visible: Bool;
}

contract TestContract {
  shape: ComplexShape;

  init() {
    self.shape = ComplexShape{
      circ: Circle{center: Point{x: 0, y: 0}, radius: 10},
      rect: Rectangle{topLeft: Point{x: -5, y: 5}, bottomRight: Point{x: 5, y: -5}},
      visible: true
    };
  }
}