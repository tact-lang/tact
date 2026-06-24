struct WithDefaults {
  a: Int = 10;
  b: Bool = false;
  c: Int?;
}

contract OptionalDefaults {
  d: WithDefaults;

  init() {
    self.d = WithDefaults{};
  }
}
