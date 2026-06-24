struct HasCell {
  c: Cell;
}

contract CellStorageTest {
  rec: HasCell;

  init() {
    self.rec = HasCell{ c: emptyCell() };
  }
}
