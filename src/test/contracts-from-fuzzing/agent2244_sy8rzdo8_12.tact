struct NestedOptDefault {
  foo: Int? = null;
  bar: Bool? = null;
  baz: String? = null;
}

contract OptDefaults {
  val: NestedOptDefault;

  init() {
    self.val = NestedOptDefault{};
  }
}
