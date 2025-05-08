struct ZeroOne {
  zero: Int = 0;
  one: Int = 1;
}

contract DefaultOverrides {
  pair: ZeroOne;

  init() {
    self.pair = ZeroOne{}; // use the defaults
  }
}