struct InnerMost {
  foo: Int = 1;
  bar: Bool? = null;
}

struct Inner {
  im: InnerMost?;
}

struct Outer {
  inner: Inner?;
  val: Int;
}

contract TestContract {
  state: Outer;
  init() {
    self.state = Outer{inner: null, val: 100};
  }
}