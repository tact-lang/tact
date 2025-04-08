struct NestedCells {
  c: Cell;
  s: Slice;
}

struct Wrapper {
  inner: NestedCells;
  i: Int;
}

contract CellSliceNest {
  data: Wrapper;

  init() {
    let c = emptyCell();
    self.data = Wrapper{
      inner: NestedCells{
        c: c,
        s: c.asSlice()
      },
      i: 123
    };
  }
}