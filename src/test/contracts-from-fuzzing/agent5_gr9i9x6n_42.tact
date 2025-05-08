struct LastRemaining {
  a: Int;
  tail: Slice as remaining;
}

contract RemainingFieldContract {
  data: LastRemaining;

  init() {
    self.data = LastRemaining{
      a: 5,
      tail: emptyCell().asSlice()
    };
  }

  receive() {
    let _ = self.data.tail;
  }
}
