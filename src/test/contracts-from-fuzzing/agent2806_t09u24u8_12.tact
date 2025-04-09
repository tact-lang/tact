struct NestedDefaults {
  foo: Int = 8;
  bar: Bool = true;
}

struct Container {
  nested: NestedDefaults = NestedDefaults{};
  s: String = "x";
}

contract NestedInit {
  stuff: Container;

  init() {
    self.stuff = Container{};
  }
}