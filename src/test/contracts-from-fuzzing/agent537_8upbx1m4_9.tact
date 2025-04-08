struct InnerMost {
  z: Int;
}

struct Inner {
  y: Int;
  im: InnerMost?;
}

contract Test {
  nested: Inner;

  init() {
    self.nested = Inner{
      y: 42,
      im: InnerMost{z: 100}
    };
  }
}
