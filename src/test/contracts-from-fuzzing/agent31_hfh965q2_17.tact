struct CS {
  a: Int;
}

contract Test {
  s1: CS;
  s2: CS;
  s3: CS;
  s4: CS;

  init() {
    self.s1 = CS{a: 1};
    self.s2 = CS{a: 2};
    self.s3 = CS{a: 3};
    self.s4 = CS{a: 4};
  }
}