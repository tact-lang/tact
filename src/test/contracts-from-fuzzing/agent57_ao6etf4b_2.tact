struct Point {
  x: Int;
  y: Int;
}

struct Container {
  inner: Point;
  optInner: Point?;
}

contract Test {
  val: Container;

  init() {
    self.val = Container{ inner: Point{ x: 1, y: 2 }, optInner: null };
  }
}