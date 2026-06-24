struct CellHolder {
  x: Cell;
  y: Slice;
}

contract CellsTest {
  data: CellHolder;

  init() {
    self.data = CellHolder{ x: emptyCell(), y: emptyCell().asSlice() };
  }
}
