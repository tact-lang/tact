contract OptionalCell {
  c: Cell?;

  init() {
    self.c = emptyCell();
  }
}