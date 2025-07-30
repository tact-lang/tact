struct SInner {
  a: Int;
}

contract FieldReassign {
  f: SInner;

  init() {
    self.f = SInner{ a: 7 };
    self.f = SInner{ a: 42 };
  }
}