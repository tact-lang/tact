struct NestedDefaults {
  foo: Int = 12;
  bar: Bool = true;
  baz: String = "abc";
}

contract TestDefaults {
  field: NestedDefaults;

  init() {
    self.field = NestedDefaults{};
  }
}
