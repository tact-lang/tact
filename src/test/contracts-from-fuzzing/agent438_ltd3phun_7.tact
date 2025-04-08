struct Inner {
  a: Int?;
  b: Bool;
}

struct Outer {
  x: Inner?;
}

contract TestContract {
  s: Outer;

  init() {
    self.s = Outer{
      x: Inner{ a: 5, b: true }
    };
  }
}