struct S1 {
  x: Int;
}

struct S2 {
  y: Int;
}

contract TestContract {
  s1: S1;
  s2: S2;
  num: Int;

  init() {
    self.s1 = S1{ x: 1 };
    self.s2 = S2{ y: 2 };
    self.num = 3;
  }
}