struct HasSliceCell {
  s: Slice;
  c: Cell;
}

contract CellFields {
  store: HasSliceCell;

  init() {
    self.store = HasSliceCell{
      s: emptyCell().asSlice(),
      c: emptyCell()
    };
  }
}