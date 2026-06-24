struct BoolIntMix {
  a: Bool;
  b: Int;
  c: Bool;
  d: Int;
}

contract BoolIntMixStorage {
  data: BoolIntMix;

  init() {
    self.data = BoolIntMix{a: true, b: 1, c: false, d: 2};
  }
}