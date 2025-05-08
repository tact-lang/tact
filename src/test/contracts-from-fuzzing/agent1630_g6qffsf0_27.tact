contract InitCellRuntime {
  c: Cell;

  init() {
    self.c = emptyCell();
  }
}