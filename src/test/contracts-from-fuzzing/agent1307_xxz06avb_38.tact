contract CellInitInInit {
  cf: Cell;

  init() {
    self.cf = emptyCell();
  }
}