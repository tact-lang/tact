// Contract with nested Slice and Cell combinations
struct InnerCellSlice {
  s: Slice;
  c: Cell;
}

struct OuterStruct {
  nested: InnerCellSlice;
  c2: Cell;
  s2: Slice;
}

contract CellSliceNest {
  data: OuterStruct;

  init() {
    self.data = OuterStruct{
      nested: InnerCellSlice{
        s: emptyCell().asSlice(),
        c: emptyCell()
      },
      c2: emptyCell(),
      s2: emptyCell().asSlice()
    };
  }
}