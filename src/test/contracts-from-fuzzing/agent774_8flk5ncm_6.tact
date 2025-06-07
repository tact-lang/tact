struct WithDefaults {
  x: Int = 42;
  y: String = "hi";
  z: Bool?;
}

contract DefaultValues {
  val: WithDefaults;
  init() {
    self.val = WithDefaults{};
  }
}