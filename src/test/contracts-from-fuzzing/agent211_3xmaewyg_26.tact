struct DeepOpt {
  a: Int?;
  b: Bool?;
}

struct OuterOpt {
  inner: DeepOpt?;
}

contract NullDeepOpt {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{
      inner: null
    };
  }
}
