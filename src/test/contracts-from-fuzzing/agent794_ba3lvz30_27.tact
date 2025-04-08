struct RemainStruct {
  a: Int;
  tail: Slice as remaining;
}

contract DoubleRemain {
  first: RemainStruct;
  second: RemainStruct;

  init() {
    self.first = RemainStruct{ a: 1, tail: emptyCell().asSlice() };
    self.second = RemainStruct{ a: 2, tail: emptyCell().asSlice() };
  }
}
