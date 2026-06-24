struct S1 {
  n: Int;
}

struct S2 {
  s: S1?;
}

contract OptNested {
  d: S2;
  init() {
    self.d = S2{ s: S1{ n: 3 } };
  }
}