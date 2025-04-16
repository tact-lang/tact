struct HasDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "abc";
}

contract DefaultsTest {
  f: HasDefaults;

  init() {
    self.f = HasDefaults{};
  }
}