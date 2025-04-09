struct InnerMost {
  b: Bool;
}

struct InnerOptional {
  inner: InnerMost?;
}

contract DeepOpt {
  d: InnerOptional;

  init() {
    self.d = InnerOptional{inner: null};
  }
}