// Test struct with many slices and cells
struct ManyCells {
  c1: Cell;
  c2: Cell;
  s1: Slice;
  s2: Slice;
  s3: Slice;
}

contract CellsTest {
  data: ManyCells;
  init() {
    let empty = emptyCell();
    self.data = ManyCells{
      c1: empty,
      c2: empty,
      s1: empty.asSlice(),
      s2: empty.asSlice(),
      s3: empty.asSlice()
    };
  }
}