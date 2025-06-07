struct NestedDefaults {
  a: Int = 5;
  b: Bool = true;
}

struct Container {
  inner: NestedDefaults = NestedDefaults{};
  x: Int = 10;
}

contract DefaultedStruct {
  data: Container;

  init() {
    self.data = Container{};
  }
}
