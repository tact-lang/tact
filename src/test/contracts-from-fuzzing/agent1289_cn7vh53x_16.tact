struct HasSlice {
  s: Slice;
}

contract SliceStorageTest {
  rec: HasSlice;

  init() {
    self.rec = HasSlice{ s: emptyCell().asSlice() };
  }
}
