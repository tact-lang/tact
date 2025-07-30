struct WithRemaining {
  data: Int;
  tail: Slice as remaining;
}

contract RemainingFieldContract {
  payload: WithRemaining;

  init() {
    self.payload = WithRemaining{
      data: 777,
      tail: emptyCell().asSlice(),
    };
  }
}