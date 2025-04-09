contract SliceCellInit {
  cl: Cell;
  sl: Slice;
  init() {
    self.cl = emptyCell();
    self.sl = emptyCell().asSlice();
  }
}