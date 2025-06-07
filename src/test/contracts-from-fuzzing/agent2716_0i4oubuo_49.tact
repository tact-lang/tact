struct RemNested {
  x: Int;
  tail: Slice as remaining;
}
contract RemInStruct {
  data: RemNested;
  init() {
    self.data = RemNested{x:1, tail: emptyCell().asSlice()};
  }
}