struct WithDefaults {
  a: Int = 100;
  b: Bool = true;
  s: String = "abc";
}

contract DefaultsDeep {
  nested: WithDefaults;

  init() {
    self.nested = WithDefaults{};
  }
}