struct WithDefaults {
  a: Int = 7;
  b: Bool = false;
  c: String = "bar";
}

contract StructDefaults {
  sd: WithDefaults;

  init() {
    self.sd = WithDefaults{};
  }
}