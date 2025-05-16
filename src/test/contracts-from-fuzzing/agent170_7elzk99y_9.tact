struct CellStruct {
  c1: Cell;
  c2: Cell?;
  s: Slice;
  sOpt: Slice?;
}

contract CellTest {
  data: CellStruct;

  init() {
    self.data = CellStruct{
      c1: emptyCell(),
      c2: null,
      s: emptyCell().asSlice(),
      sOpt: null
    };
  }
}