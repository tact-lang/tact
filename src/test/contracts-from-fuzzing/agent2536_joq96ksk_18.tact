// struct with slices, builders, addresses, cells
struct MultiPrimitives {
  c: Cell;
  s: Slice;
  b: Builder;
  a: Address;
}

contract ContMultiPrimitives {
  dat: MultiPrimitives;

  init() {
    self.dat = MultiPrimitives{
      c: emptyCell(),
      s: emptyCell().asSlice(),
      b: beginCell(),
      a: myAddress()
    };
  }
}