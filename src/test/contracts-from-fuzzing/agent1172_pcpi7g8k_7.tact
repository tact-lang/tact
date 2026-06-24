struct FlatDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "test";
  d: Int?;
  e: Bool?;
}

contract DefaultVals {
  data: FlatDefaults;

  init() {
    self.data = FlatDefaults{};
  }
}