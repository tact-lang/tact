struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

contract ManyStructs {
  s1: S1;
  s2: S2;
  x: Int;

  init() {
    self.s1 = S1{a: 1};
    self.s2 = S2{b: 2};
    self.x = 3;
  }
}