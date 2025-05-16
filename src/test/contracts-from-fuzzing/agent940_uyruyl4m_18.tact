contract OptionalCellSliceBuilder {
  c: Cell?;
  s: Slice?;
  b: Builder?;

  init() {
    self.c = emptyCell();
    self.s = emptyCell().asSlice();
    self.b = beginCell();
  }
}
