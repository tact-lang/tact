struct WithDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hello";
}

contract DefaultsTest {
  s: WithDefaults;

  init() {
    self.s = WithDefaults{};
  }
}