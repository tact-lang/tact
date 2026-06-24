struct Inner {
  p: Point;
}

struct Point {
  x: Int;
  y: Int;
}

contract OptionalNested {
  i: Inner?;

  init() {
    self.i = null;
  }
}