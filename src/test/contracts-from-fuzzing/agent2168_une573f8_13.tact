contract CellInInit {
  c: Cell;

  init() {
    self.c = emptyCell();
  }
}