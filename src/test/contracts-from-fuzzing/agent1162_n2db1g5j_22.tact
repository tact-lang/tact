struct S1 {
  a: Int;
}

contract ContractA {
  s: S1;

  init() {
    self.s = S1{a:10};
  }
}

struct S2 {
  s1: S1;
  b: Bool;
}

contract ContractB {
  s: S2;

  init() {
    self.s = S2{
      s1: S1{a:20},
      b: true
    };
  }
}