struct S {
  a: Int;
}

contract ContractA {
  s: S;

  init() {
    self.s = S{a: 7};
  }
}

contract ContractB {
  s: S;

  init() {
    self.s = S{a: 42};
  }
}