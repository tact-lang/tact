struct Tiny {
  a: Int;
}

contract DefaultValTest {
  field: Tiny = Tiny{a: 42};

  init() {
    self.field = Tiny{a: 5};
  }
}