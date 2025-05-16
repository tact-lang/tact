struct TailRemaining {
  prefix: Int;
  tail: Slice as remaining;
}

contract TailRemainStorage {
  state: TailRemaining;
  init() {
    self.state = TailRemaining{prefix:5, tail: emptyCell().asSlice()};
  }
}