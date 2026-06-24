struct S1 {
  a: Int;
}

struct S2 {
  s1a: S1;
  s1b: S1;
}

contract MultipleSameStructs {
  s2: S2;

  init() {
    self.s2 = S2{
      s1a: S1{a:10},
      s1b: S1{a:20}
    };
  }
}