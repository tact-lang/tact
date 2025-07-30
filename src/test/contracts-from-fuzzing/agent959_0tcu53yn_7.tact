struct Point {
  x: Int;
  y: Int;
}

struct Container {
  p1: Point;
  p2: Point;
  opt: Point?;
}

contract NestedOptionals {
  val: Container;
  init() {
    self.val = Container{
      p1: Point{x:1,y:2},
      p2: Point{x:3,y:4},
      opt: null
    };
  }
}