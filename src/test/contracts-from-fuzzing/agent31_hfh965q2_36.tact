struct WithDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "abc";
}

contract Test {
  data: WithDefaults;

  init() {
    self.data = WithDefaults{};
  }
}