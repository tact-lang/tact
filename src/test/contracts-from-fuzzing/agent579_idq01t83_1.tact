struct InnerMost {
  a: Int;
  b: Bool;
}

struct Inner {
  x: Int;
  i: InnerMost;
}

contract DeepNestedStruct {
  data: Inner;

  init() {
    self.data = Inner{
      x: 1,
      i: InnerMost{
        a: 2,
        b: true,
      },
    };
  }
}