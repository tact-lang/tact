struct Inner {
  x: Int?;
}

struct Outer {
  inner: Inner?;
}

contract MayNest {
  state: Outer;

  init() {
    self.state = Outer{ inner: null };
  }
}