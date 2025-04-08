struct NestedOptionalDefaults {
  foo: Int? = null;
  bar: Bool? = null;
  baz: Int = 100;
}

contract OptionalDefaultsTest {
  data: NestedOptionalDefaults;

  init() {
    self.data = NestedOptionalDefaults{};
  }
}
