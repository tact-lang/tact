struct CellHolder {
  c: Cell;
}
contract CellNoDefault {
  s: CellHolder;
  init() {
    self.s = CellHolder{ c: emptyCell() };
  }
}