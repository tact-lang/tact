struct TwoSame {
  a: Int;
  b: Int;
}

contract DoubleStructs {
  s1: TwoSame;
  s2: TwoSame;

  init() {
    self.s1 = TwoSame{a:1, b:2};
    self.s2 = TwoSame{a:3, b:4};
  }
}