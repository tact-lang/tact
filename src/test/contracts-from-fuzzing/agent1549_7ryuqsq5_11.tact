struct NestedDefaults {
  a: Int = 1;
  b: String = "foo";
}

struct Container {
  nest: NestedDefaults = NestedDefaults{};
  someFlag: Bool = false;
}

contract Test {
  cont: Container;
  init() {
    self.cont = Container{};
  }
}