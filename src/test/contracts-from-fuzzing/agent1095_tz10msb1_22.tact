struct BigOptionalDefaults {
  a: Int? = null;
  b: Bool? = false;
  c: Int? = 3;
  d: Bool? = null;
  e: String = "hello";
}

contract OptionalDefaultsTest {
  store: BigOptionalDefaults;

  init() {
    self.store = BigOptionalDefaults{};
  }
}