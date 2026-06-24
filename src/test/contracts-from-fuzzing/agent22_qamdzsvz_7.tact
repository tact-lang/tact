struct Inner {
  a: Int;
}

struct Outer {
  inner: Inner;
}

contract TestNullableNested {
  data: Outer?;

  init() {
    self.data = null;
  }
}