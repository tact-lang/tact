struct BigDefaults {
  a: Int = 10;
  b: Int = 20;
  c: Int = 30;
  d: Int = 40;
  e: Int = 50;
}

contract InitializeBig {
  big: BigDefaults;

  init() {
    self.big = BigDefaults{};
  }
}