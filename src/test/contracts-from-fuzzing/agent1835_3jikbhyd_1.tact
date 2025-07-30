struct InnerMost {
  z: Int;
}

struct Inner {
  x: Int;
  y: InnerMost;
}

contract DeepNestedTest {
  nested: Inner;

  init() {
    self.nested = Inner{
      x: 1,
      y: InnerMost{ z: 2 },
    };
  }
}
