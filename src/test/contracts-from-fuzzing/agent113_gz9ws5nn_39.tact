struct RestHolder {
  id: Int;
  rest: Slice as remaining;
}

contract TestRemaining {
  s: RestHolder;

  init() {
    self.s = RestHolder{ id: 42, rest: beginCell().endCell().asSlice() };
  }
}