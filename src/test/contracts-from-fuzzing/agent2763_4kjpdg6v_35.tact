struct CellStruct {
  c: Cell;
  s: Slice;
}

contract CellPersistent {
  val: CellStruct;

  init() {
    self.val = CellStruct {
      c: emptyCell(),
      s: emptySlice(),
    };
  }
}