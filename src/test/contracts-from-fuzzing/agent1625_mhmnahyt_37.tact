struct OptionalsAtDepth {
  a: InnerOne?;
}

struct InnerOne {
  b: InnerTwo?;
}

struct InnerTwo {
  c: Int?;
  d: Bool?;
}

contract DeepOptions {
  s: OptionalsAtDepth;

  init() {
    self.s = OptionalsAtDepth {
      a: null,
    };
  }
}
