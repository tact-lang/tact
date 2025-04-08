struct CellMix {
  b1: Builder;
  b2: Builder?;
  s1: Slice;
  s2: Slice?;
  c1: Cell;
  c2: Cell?;
}

contract CellMixContract {
  data: CellMix;

  init() {
    self.data = CellMix{
      b1: beginCell(),
      b2: null,
      s1: emptyCell().asSlice(),
      s2: null,
      c1: emptyCell(),
      c2: null
    };
  }
}
