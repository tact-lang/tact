contract SliceField {
  s: Slice;

  init() {
    self.s = emptyCell().asSlice();
  }
}