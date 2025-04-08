struct CellSliceWrap {
  c: Cell;
  s: Slice;
}

contract CellSliceStructContract {
  data: CellSliceWrap;

  init() {
    self.data = CellSliceWrap{
      c: emptyCell(),
      s: emptyCell().asSlice(),
    };
  }
}
