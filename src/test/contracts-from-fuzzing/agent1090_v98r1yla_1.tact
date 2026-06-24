struct InnerMost {
  value: Int;
}

struct Inner {
  a: Int;
  b: InnerMost;
}

contract DeepNestedContract {
  nested: Inner;

  init() {
    self.nested = Inner{
      a: 1,
      b: InnerMost{ value: 2 }
    };
  }
}
