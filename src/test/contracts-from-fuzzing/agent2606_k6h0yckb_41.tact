struct Inner {
  a: Int;
}

struct Outer {
  inner: Inner;
}

contract StructReplace {
  val: Outer;

  init() {
    self.val = Outer{ inner: Inner{ a: 1 } };
    self.val.inner = Inner{ a: 42 };
  }
}