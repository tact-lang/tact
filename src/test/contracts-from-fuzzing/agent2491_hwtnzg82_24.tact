struct NestedDefault {
  a: Int = 1;
  b: Bool = false;
}

contract NestedDefaults {
  field: NestedDefault = NestedDefault{};

  init() {
    self.field = NestedDefault{};
  }
}