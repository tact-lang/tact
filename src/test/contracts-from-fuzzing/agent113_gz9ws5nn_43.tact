struct BigDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "x";
  d: Int?;
  e: Bool?;
  f: String?;
}

contract TestBigDefaults {
  s: BigDefaults;

  init() {
    self.s = BigDefaults{};
  }
}