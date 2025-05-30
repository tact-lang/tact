struct S {
  a: Int;
  b: Int?;
}

contract TestContract {
  s1: S;
  s2: S;

  init() {
    self.s1 = S{ a: 1, b: null };
    self.s2 = S{ a: 2, b: 3 };
  }
}