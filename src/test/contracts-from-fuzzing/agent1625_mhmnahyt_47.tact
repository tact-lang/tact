contract OptionalCellPrimitives {
  a: Int?;
  b: Cell?;
  c: Cell;

  init() {
    self.a = null;
    self.b = null;
    self.c = emptyCell();
  }
}
