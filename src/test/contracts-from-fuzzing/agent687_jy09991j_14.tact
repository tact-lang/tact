struct CellStruct {
  c1: Cell;
  c2: Slice;
  c3: Cell?;
  c4: Slice?;
}

contract CellTest {
  val: CellStruct;

  init() {
    self.val = CellStruct{
      c1: emptyCell(),
      c2: emptyCell().asSlice(),
      c3: null,
      c4: null
    };
  }
}