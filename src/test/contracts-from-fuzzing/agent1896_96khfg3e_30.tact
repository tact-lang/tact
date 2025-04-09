struct WithManyDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
}

contract StructDefaults {
  f: WithManyDefaults;

  init() {
    self.f = WithManyDefaults{};
  }
}