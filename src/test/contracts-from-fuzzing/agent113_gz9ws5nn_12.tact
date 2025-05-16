struct DefaultVals {
  a: Int = 5;
  b: Bool = true;
  c: String = "hi";
  d: Int?;
}

contract WithDefaults {
  s: DefaultVals;

  init() {
    self.s = DefaultVals{ };
  }
}