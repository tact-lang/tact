struct Inner {
  foo: Int;
}

struct Middle {
  nested: Inner?;
}

struct Outer {
  inner: Middle;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{inner: Middle{nested: Inner{foo: 123}}};
  }
}
