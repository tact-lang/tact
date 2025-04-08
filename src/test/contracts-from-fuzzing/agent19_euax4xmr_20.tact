struct Inner {
  tiny: Int as int3;
}

contract Test {
  s: Inner;

  init() {
    self.s = Inner{ tiny: -5 }; // invalid, less than -4
  }
}