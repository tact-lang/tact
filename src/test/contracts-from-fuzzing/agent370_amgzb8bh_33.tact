struct InnerMost {
  a: Int;
}

struct Inner {
  i: InnerMost;
}

contract DeepDeep {
  d: Inner;

  init() {
    self.d = Inner{ i: InnerMost{ a: 999 } };
  }
}