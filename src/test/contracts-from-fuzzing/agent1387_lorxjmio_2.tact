struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{ inner: Inner{ a: 7, b: false }, flag: true };
  }
}