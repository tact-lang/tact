struct S2 {
  val: Int;
}

struct S1 {
  maybe: S2?;
}

contract Test {
  s: S1;
  init() {
    self.s = S1{maybe: null};
  }
}