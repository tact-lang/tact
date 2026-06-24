struct HasSliceAndCell {
  s: Slice;
  c: Cell;
}

contract ComboSliceCell {
  data: HasSliceAndCell;

  init() {
    self.data = HasSliceAndCell{
      s: emptyCell().asSlice(),
      c: emptyCell()
    };
  }
}