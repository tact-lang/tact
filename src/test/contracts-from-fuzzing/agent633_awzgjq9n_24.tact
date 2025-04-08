struct CellSliceString {
  a: Cell;
  b: Slice;
  c: String;
}

contract CellSliceStringContract {
  data: CellSliceString;

  init() {
    self.data = CellSliceString{
      a: emptyCell(),
      b: emptyCell().asSlice(),
      c: "test"
    };
  }
}
