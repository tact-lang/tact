struct InlineDefaults {
  a: Int = 10;
  b: Bool = true;
  c: String = "abc";
  d: Int?;
  e: String? = null;
}

contract DefaultsTest {
  fld: InlineDefaults;
  init() {
    self.fld = InlineDefaults{ };
  }
}