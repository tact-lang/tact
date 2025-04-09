struct RemainingHolder {
  prefix: Int as uint8;
  rest: Slice as remaining;
}

contract RemainingFieldContract {
  val: RemainingHolder;

  init() {
    self.val = RemainingHolder{
      prefix: 42,
      rest: emptyCell().asSlice()
    };
  }
}