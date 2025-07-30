struct S {
  x: Int;
}

contract DefaultTest {
  s: S = S{x: 5};

  init() {
    self.s = S{x: 10};
  }
}