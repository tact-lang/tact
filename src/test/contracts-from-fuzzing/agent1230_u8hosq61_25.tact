struct RemData {
  a: Int = 0;
  rest: Slice as remaining;
}

contract HasRemaining {
  data: RemData;

  init() {
    self.data = RemData{ rest: emptyCell().asSlice() };
  }
}