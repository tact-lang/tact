struct ManyDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";
  d: Int = 42;
  e: Bool = true;
  f: String = "y";
}

contract ContractWithManyDefaults {
  data: ManyDefaults;

  init() {
    self.data = ManyDefaults{};
  }
}