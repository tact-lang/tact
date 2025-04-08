struct ContainsRemaining {
  prefix: Int as uint4;
  tail: Slice as remaining;
}

contract TestContract {
  x: ContainsRemaining;

  init() {
    self.x = ContainsRemaining{
      prefix: 7,
      tail: emptyCell().asSlice()
    };
  }
}