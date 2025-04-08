struct Mixed {
  count: Int;
  flag: Bool;
  addr: Address;
  cellVal: Cell;
  sliceVal: Slice;
}

contract TestMixed {
  data: Mixed;

  init() {
    self.data = Mixed{
      count: 1,
      flag: true,
      addr: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
    };
  }
}
