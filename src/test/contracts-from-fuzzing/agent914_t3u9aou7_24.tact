contract OptionalSlice {
  s: Slice?;

  init() {
    self.s = emptyCell().asSlice();
  }
}