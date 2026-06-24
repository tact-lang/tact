struct NestedDefaults {
  foo: Int = 1;
  bar: InnerDefaults;
}

struct InnerDefaults {
  baz: Int = 42;
}

contract NestedDefaultsStorage {
  data: NestedDefaults;

  init() {
    self.data = NestedDefaults{bar: InnerDefaults{}};
  }
}