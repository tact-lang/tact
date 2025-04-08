contract CellStringFields {
  c: Cell;
  s: String;

  init() {
    self.c = emptyCell();
    self.s = "str";
  }
}