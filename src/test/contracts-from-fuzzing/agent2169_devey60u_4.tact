struct InnerMost {
  val: Int;
}

struct Inner {
  innerMost: InnerMost;
}

struct Outer {
  inner: Inner;
}

contract DeeplyNestedStorage {
  storage: Outer;

  init() {
    self.storage = Outer{inner: Inner{innerMost: InnerMost{val: 42}}};
  }
}