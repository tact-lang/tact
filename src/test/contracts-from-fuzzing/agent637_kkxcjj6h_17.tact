struct S1 {
  f1: Int;
  f2: Bool?;
}

struct S2 {
  s1: S1;
  opt: Int?;
}

contract Test {
  nested: S2;
  init() {
    self.nested = S2{
      s1: S1{ f1: 123 },
      opt: null
    };
  }
  receive() {}
}