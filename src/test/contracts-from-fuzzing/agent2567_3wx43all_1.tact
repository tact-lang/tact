struct InnerMost {
  a: Int;
  b: Bool?;
}

struct Inner {
  c: InnerMost;
  d: String;
}

contract DeepNestedContract {
  x: Inner;
  
  init() {
    self.x = Inner{
      c: InnerMost{a: 1, b: true},
      d: "test"
    };
  }
}