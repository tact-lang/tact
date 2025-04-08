contract StringSliceCell {
  s: String;
  sliceVal: Slice;
  cellVal: Cell;

  init() {
    self.s = "data";
    self.sliceVal = emptyCell().asSlice();
    self.cellVal = emptyCell();
  }
}