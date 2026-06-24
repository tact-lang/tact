struct HasCellAndSlice {
  c: Cell;
  s: Slice;
}

contract CellSliceFields {
  data: HasCellAndSlice;

  init() {
    self.data = HasCellAndSlice{
      c: emptyCell(),
      s: emptyCell().asSlice()
    };
  }
}