struct S {
  x: Int;
}

contract ArrayLike {
  a1: S;
  a2: S;
  a3: S;

  init() {
    self.a1 = S{ x: 1 };
    self.a2 = S{ x: 2 };
    self.a3 = S{ x: 3 };
  }
}
