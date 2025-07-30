struct NestedCellOpts {
  c1: Cell?;
  c2: Cell;
  c3: Cell?;
}

contract CellOptionals {
  s: NestedCellOpts;

  init() {
    self.s = NestedCellOpts{
      c1: null,
      c2: emptyCell(),
      c3: null
    };
  }
}