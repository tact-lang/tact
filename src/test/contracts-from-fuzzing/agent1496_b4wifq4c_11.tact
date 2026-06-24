struct HasDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "s";
}

contract DefaultStructTest {
  v: HasDefaults;

  init() {
    self.v = HasDefaults{};
  }
}