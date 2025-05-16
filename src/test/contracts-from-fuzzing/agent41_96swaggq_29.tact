struct ComposeCells {
  c1: Cell;
  c2: Cell;
  c3: Cell;
}

contract CellsTest {
  s: ComposeCells;

  init() {
    let empty = emptyCell();
    self.s = ComposeCells{
      c1: empty,
      c2: empty,
      c3: empty
    };
  }
}
