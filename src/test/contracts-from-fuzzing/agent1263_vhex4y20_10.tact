struct WithDefaults {
  x: Int = 4;
  y: Bool = false;
}

contract TestContract {
  wd: WithDefaults;

  init() {
    self.wd = WithDefaults{};
  }
}