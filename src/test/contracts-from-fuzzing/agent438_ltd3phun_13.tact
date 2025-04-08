struct HasSliceCellAddr {
  s: Slice;
  c: Cell;
  a: Address;
}

contract TestContract {
  data: HasSliceCellAddr;

  init() {
    self.data = HasSliceCellAddr{
      s: emptyCell().asSlice(),
      c: emptyCell(),
      a: myAddress(),
    };
  }
}