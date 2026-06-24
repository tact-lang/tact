struct SRem {
  id: Int;
  rest: Slice as remaining;
}

contract StructWithRemaining {
  s: SRem;

  init() {
    self.s = SRem{id: 5, rest: emptySlice()};
  }
}