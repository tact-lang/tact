struct TailRem {
  a: Int;
  b: Slice as remaining;
}

contract TailRemaining {
  data: TailRem;
  init() {
    self.data = TailRem{a:1,b:emptyCell().asSlice()};
  }
}