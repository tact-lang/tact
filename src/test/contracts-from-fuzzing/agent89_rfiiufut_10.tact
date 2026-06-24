struct HasRemaining {
  a: Int;
  rest: Slice as remaining;
}

contract RemainingTail {
  s: HasRemaining;

  init() {
    self.s = HasRemaining { a:1, rest: emptyCell().asSlice() };
  }
}
