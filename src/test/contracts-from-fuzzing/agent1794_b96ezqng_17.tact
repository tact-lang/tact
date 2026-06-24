struct X {
  a: Int;
}

struct Y {
  b: Int;
}

contract TwoStructsOpt {
  a: X?;
  b: Y?;

  init() {
    self.a = X { a: 10 };
    self.b = null;
  }
}
