struct X {
  a: Int;
}

struct Y {
  b: X;
}

struct Z {
  c: Y;
}

contract UltraDeep {
  ult: Z;

  init() {
    self.ult = Z{ c: Y{ b: X{ a:123 } } };
  }
}