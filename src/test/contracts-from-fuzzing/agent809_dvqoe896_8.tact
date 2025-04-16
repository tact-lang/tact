struct WithDefaults {
  x: Int = 10;
  y: Bool = false;
  z: String = "abc";
}

contract StructDefaults {
  data: WithDefaults;

  init() {
    self.data = WithDefaults{};
  }
}
