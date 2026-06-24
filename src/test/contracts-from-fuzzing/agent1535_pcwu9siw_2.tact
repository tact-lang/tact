struct Inner {
  a: Int;
  b: Int?;
}

struct Outer {
  inner: Inner;
  c: Int;
}

contract TestContract {
  state: Outer;

  init() {
    self.state = Outer{ inner: Inner{ a: 1, b: null }, c: 42 };
  }
}