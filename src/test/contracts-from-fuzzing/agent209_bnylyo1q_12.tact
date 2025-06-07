struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  x: Inner?;
  y: Bool;
}

contract TestContract {
  d: Outer;

  init() {
    self.d = Outer{
      x: null,
      y: false
    };
  }
}