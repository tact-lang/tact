struct S1 {
  f1: Int;
}

struct S2 {
  f2: Int;
  opt: S1?;
}

contract OptNested {
  storage: S2;

  init() {
    self.storage = S2{f2: 5, opt: null};
  }
}
