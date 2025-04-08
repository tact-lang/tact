struct BoolAndIntMixed {
  a: Bool;
  b: Int as uint4;
  c: Bool;
  d: Int as uint4;
}

contract BoolIntMixContract {
  data: BoolAndIntMixed;

  init() {
    self.data = BoolAndIntMixed{ a: true, b: 15, c: false, d: 0 };
  }
}
