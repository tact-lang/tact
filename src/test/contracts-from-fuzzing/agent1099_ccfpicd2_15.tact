struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
  inner: S1;
}

contract Chain {
  s2: S2;

  init() {
    self.s2 = S2{
      b: 2,
      inner: S1{ a: 1 },
    };
  }
}