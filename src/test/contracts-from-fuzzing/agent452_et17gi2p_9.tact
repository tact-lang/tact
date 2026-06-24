struct Inner {
  x: Int?;
}

struct Outer {
  inner: Inner?;
}

contract OptOpt {
  s: Outer?;

  init() {
    self.s = null;
  }
}