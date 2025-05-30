struct HasSlices {
  c: Cell;
  s: Slice;
}

contract SliceFields {
  field: HasSlices;

  init() {
    let empty = emptyCell();
    self.field = HasSlices{
      c: empty,
      s: empty.asSlice(),
    };
  }
}