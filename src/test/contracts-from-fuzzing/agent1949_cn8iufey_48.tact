struct SInts {
  a: Int;
  b: Int;
}

contract TwoSInts {
  s1: SInts;
  s2: SInts;

  init() {
    self.s1 = SInts{a:1,b:2};
    self.s2 = SInts{a:3,b:4};
  }
}
