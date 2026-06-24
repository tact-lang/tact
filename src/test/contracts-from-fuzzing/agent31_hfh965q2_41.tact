struct S1 {
  val: Int;
}

struct S2 {
  s1: S1;
  other: Int;
}

contract Test {
  data: S2;

  init() {
    self.data = S2{ s1: S1{val: 33}, other: 44 };
  }
}