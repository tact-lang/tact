struct SL {
  a: Slice;
  b: Slice?;
  c: Cell;
  d: Cell?;
}

contract SliceCellMix {
  s: SL;

  init() {
    self.s = SL{
      a: "x".asSlice(),
      b: null,
      c: emptyCell(),
      d: null,
    };
  }
}
