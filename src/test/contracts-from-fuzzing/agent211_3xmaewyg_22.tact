struct RemainS {
  start: Int;
  remain: Slice as remaining;
}

contract RemainingSliceStorage {
  s: RemainS;

  init() {
    self.s = RemainS{
      start: 5,
      remain: emptyCell().asSlice(),
    };
  }
}
