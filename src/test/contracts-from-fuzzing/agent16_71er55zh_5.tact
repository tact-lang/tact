struct Inner {
  value: Int;
}

struct Outer {
  wrapped: Inner;
  flag: Bool;
}

contract StructInStruct {
  s: Outer;

  init() {
    self.s = Outer{ wrapped: Inner{ value: 42 }, flag: true };
  }
}
