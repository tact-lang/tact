contract OptionalSlicesCells {
  sliceField: Slice?;
  cellField: Cell?;

  init() {
    self.sliceField = null;
    self.cellField = null;
  }
}