struct WithDefaults {
  x: Int = 1;
  y: Int = 2;
}

contract MultiDefaults {
  d: WithDefaults;

  init() {
    self.d = WithDefaults{};
  }
}