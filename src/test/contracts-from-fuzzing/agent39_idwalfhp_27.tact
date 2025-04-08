struct DeepN {
  a: Int;
}

struct MaybeDeepN {
  v: DeepN?;
}

struct Container {
  n: MaybeDeepN?;
}

contract NullDeep {
  field: Container;

  init() {
    self.field = Container{
      n: null
    };
  }
}