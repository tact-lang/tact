struct DeepNestedOpt {
  a: Int?;
}

struct Container {
  nested: DeepNestedOpt?;
}

contract HoldsOpt {
  data: Container;

  init() {
    self.data = Container{ nested: null };
  }
}
