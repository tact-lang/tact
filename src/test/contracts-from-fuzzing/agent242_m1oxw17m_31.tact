contract OptionalCellSlice {
  c: Cell?;
  s: Slice?;

  init() {
    self.c = null;
    self.s = null;
  }
}