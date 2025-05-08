struct DeepOptional {
  inner: Int?;
}

struct Container {
  data: DeepOptional?;
}

contract NestedOptContract {
  stored: Container;

  init() {
    self.stored = Container{ data: null };
  }
}