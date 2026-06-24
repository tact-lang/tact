struct HasSlicesAndCells {
  s1: Slice;
  s2: Slice;
  c1: Cell;
  c2: Cell;
}

contract TestContract {
  data: HasSlicesAndCells;

  init() {
    self.data = HasSlicesAndCells{
      s1: emptyCell().asSlice(),
      s2: emptyCell().asSlice(),
      c1: emptyCell(),
      c2: emptyCell(),
    };
  }
}
