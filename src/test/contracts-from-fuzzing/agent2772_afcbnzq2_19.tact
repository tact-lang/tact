contract OptionalCells {
  c1: Cell?;
  c2: Cell?;

  init() {
    self.c1 = null;
    self.c2 = emptyCell();
  }
}
