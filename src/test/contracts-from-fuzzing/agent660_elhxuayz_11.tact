struct SliceAndCell {
  s: Slice;
  c: Cell;
}

contract SliceCellTest {
  data: SliceAndCell;

  init() {
    self.data = SliceAndCell{
      s: emptyCell().asSlice(),
      c: emptyCell(),
    };
  }
}