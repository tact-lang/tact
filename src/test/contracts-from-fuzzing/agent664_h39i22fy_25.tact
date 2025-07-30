struct Inner {
  foo: Int = 123;
}

struct Outer {
  inner: Inner?;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      inner: null,
    };
  }
}