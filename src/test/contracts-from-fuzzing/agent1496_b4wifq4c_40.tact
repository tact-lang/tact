contract SliceAsOptional {
  s: Slice?;

  init() {
    self.s = emptyCell().asSlice();
  }
}