struct WithDefaults {
  b: Int = 1;
  c: Bool = true;
  d: String = "ok";
  e: Int? = null;
}

contract StructWithDefaults {
  s: WithDefaults;

  init() {
    self.s = WithDefaults{};
  }
}