struct S1 {
  f: Int;
}

struct S2 {
  s1: S1;
}

contract Test {
  s2: S2;

  init() {
    self.s2 = S2{s1: S1{f: 17}};
  }
}