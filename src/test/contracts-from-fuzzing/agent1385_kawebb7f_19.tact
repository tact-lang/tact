struct Circle {
  radius: Int;
}

struct Square {
  side: Int;
}

contract ShapeHolder {
  c: Circle;
  s: Square;

  init() {
    self.c = Circle{radius: 3};
    self.s = Square{side: 4};
  }
}