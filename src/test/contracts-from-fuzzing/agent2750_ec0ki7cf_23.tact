struct RemainingFirst {
  remain: Slice as remaining;
}

contract RemainFirst {
  x: RemainingFirst;
  init() {
    self.x = RemainingFirst{
      remain: emptyCell().asSlice()
    };
  }
}
