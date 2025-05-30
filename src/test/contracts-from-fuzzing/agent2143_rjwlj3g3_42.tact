struct WithManyDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";
  d: Int = 2;
  e: Bool = false;
  f: String = "y";
}

contract DefaultsStructStorage {
  data: WithManyDefaults;

  init() {
    self.data = WithManyDefaults{};
  }
}