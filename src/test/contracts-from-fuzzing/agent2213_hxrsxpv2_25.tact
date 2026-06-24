struct X {
  val1: Int;
}

struct Y {
  val2: Int;
}

contract XYFields {
  f1: X;
  f2: Y;

  init() {
    self.f1 = X{ val1: 1 };
    self.f2 = Y{ val2: 2 };
  }
}
