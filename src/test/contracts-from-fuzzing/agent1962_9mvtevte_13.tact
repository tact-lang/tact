struct WithDefaults {
  a: Int = 10;
  b: Bool = true;
  c: String = "hi";
}

contract DefaultsTest {
  data: WithDefaults;

  init() {
    self.data = WithDefaults{};
  }
}