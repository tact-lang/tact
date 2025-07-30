struct CellStruct {
  c1: Cell;
  c2: Cell;
}

struct SliceStruct {
  s1: Slice;
  s2: Slice;
}

contract CellSliceTest {
  a: CellStruct;
  b: SliceStruct;

  init() {
    self.a = CellStruct{c1: emptyCell(), c2: emptyCell()};
    self.b = SliceStruct{s1: emptyCell().asSlice(), s2: emptyCell().asSlice()};
  }
}