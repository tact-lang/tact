struct WithSlice {
  info: Slice;
}

contract SliceStorage {
  data: WithSlice;

  init() {
    self.data = WithSlice{
      info: emptyCell().asSlice()
    };
  }
}