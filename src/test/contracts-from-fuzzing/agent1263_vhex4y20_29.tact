struct NestedDefaults {
  foo: Int = 7;
  bar: Bool = true;
}

struct Container {
  nested: NestedDefaults;
}

contract TestContract {
  s: Container;

  init() {
    self.s = Container { nested: NestedDefaults {} };
  }
}