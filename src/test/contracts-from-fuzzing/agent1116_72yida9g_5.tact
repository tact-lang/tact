struct S1 {
  i: Int;
}

struct S2 {
  s1: S1;
  s1opt: S1?;
}

contract Test {
  stored: S2;

  init() {
    self.stored = S2{
      s1: S1{ i: 1 },
      s1opt: null,
    };
  }
}
