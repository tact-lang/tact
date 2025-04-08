// Test optional Cell and optional Slice in struct
struct CellSliceOpts {
  c: Cell?;
  s: Slice?;
}

contract CellSliceOptTest {
  cs: CellSliceOpts;
  init() {
    self.cs = CellSliceOpts{ c:null, s:null };
  }
}
