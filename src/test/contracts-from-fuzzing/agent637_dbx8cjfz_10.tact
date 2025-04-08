struct CellStruct {
  cellVal: Cell;
  optCell: Cell?;
}

contract TestContract {
  storage: CellStruct;

  init() {
    self.storage = CellStruct{
      cellVal: emptyCell(),
      optCell: null
    };
  }
}