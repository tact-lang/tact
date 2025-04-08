struct Remainder {
  x: Int;
  rem: Slice as remaining;
}

contract Test {
  r: Remainder;

  init() {
    self.r = Remainder{x:1, rem:emptyCell().asSlice()};
  }
}