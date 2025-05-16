struct WithDefaults {
  x: Int = 5;
  y: Bool = false;
  z: String = "hi";
}

contract Test {
  f: WithDefaults;

  init() {
    self.f = WithDefaults{};
  }
}
