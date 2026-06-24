struct S {
  a: Int;
  b: Int?;
  c: Int?;
}

contract ChainStructs {
  s: S;

  init() {
    self.s = S { a: 1, b: null, c: null };
  }
}