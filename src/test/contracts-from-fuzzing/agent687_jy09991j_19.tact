struct OptDefaults {
  foo: Int? = null;
  bar: String? = null;
  baz: Bool? = null;
}

contract OptDefaultsTest {
  v: OptDefaults;

  init() {
    self.v = OptDefaults{};
  }
}