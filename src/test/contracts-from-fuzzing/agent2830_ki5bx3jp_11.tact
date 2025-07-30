struct DeepNestedOptional {
  inner: Int?;
  flag: Bool;
}

struct Container {
  maybeData: DeepNestedOptional?;
}

contract OptInOpt {
  storage: Container;
  init() {
    self.storage = Container{ maybeData: null };
  }
}