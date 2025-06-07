struct WithDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
}

contract DefaultsStructTest {
  s: WithDefaults;

  init() {
    self.s = WithDefaults{};
  }
}