struct Inner {
  a: Int = 5;
  b: Bool?;
}

struct Outer {
  x: Int;
  y: Inner;
}

contract Test {
  val: Outer;
  init() {
    self.val = Outer{
      x: 1,
      y: Inner{ b: true }
    };
  }
}