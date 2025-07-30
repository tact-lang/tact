struct LastRemaining {
  a: Int;
  b: Slice as remaining;
}

contract RemainingField {
  x: LastRemaining;
  init() {
    self.x = LastRemaining {
      a: 123,
      b: emptyCell().asSlice()
    };
  }
}
