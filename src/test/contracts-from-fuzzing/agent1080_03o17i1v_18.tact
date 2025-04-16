struct CellFields {
  x: Cell;
  y: Cell;
}

contract CellContract {
  data: CellFields;

  init() {
    self.data = CellFields{
      x: emptyCell(),
      y: emptyCell(),
    };
  }
}