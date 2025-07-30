struct S {
  foo: Int;
}

contract Contr {
  s: S;

  init() {
    self.s = S{ foo: 42 };
  }
}
