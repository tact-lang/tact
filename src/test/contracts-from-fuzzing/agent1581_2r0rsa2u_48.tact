struct A { x: Int; }
struct B { y: Int; z: A; }

contract FlatNest {
  val: B;

  init() {
    self.val = B{
      y: 1,
      z: A{ x:7 },
    };
  }
}