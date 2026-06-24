struct S {
  a: Int;
  b: Int;
}

contract DefaultTest {
  s: S;

  init() {
    self.s = S{a: 1, b: 2};
  }
}