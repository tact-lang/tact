struct WithRemaining {
  prefix: Int;
  suffix: Slice as remaining;
}

contract RemainingField {
  data: WithRemaining;

  init() {
    self.data = WithRemaining{
      prefix: 42,
      suffix: emptyCell().asSlice()
    };
  }
}