struct WithOptDefaults {
  a: Int? = null;
  b: Bool? = false;
  c: String? = "hello";
}

contract OptDefStruct {
  s: WithOptDefaults;

  init() {
    self.s = WithOptDefaults{};
  }
}