struct HasSlice {
  sVal: Slice;
}

contract SliceStorage {
  f: HasSlice;

  init() {
    self.f = HasSlice{ sVal: emptyCell().asSlice() };
  }
}