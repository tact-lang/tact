struct S {
  a: Int = 1;
}

contract NoInitAssign {
  data: S;

  init() {
    self.data = S{ a: 2 };
  }
}
