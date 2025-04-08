struct S {
  inner: Inner?;
}

struct Inner {
  f: Int;
}

contract Test {
  s: S;

  init() {
    self.s = S{
      inner: Inner{ f: 42 }
    };
  }
}
