struct UnusualOrder {
  str: String;
  intv: Int;
  bl: Bool;
  addr: Address;
  slice: Slice;
  cell: Cell;
}

contract WeirdOrder {
  data: UnusualOrder;

  init() {
    self.data = UnusualOrder{
      str: "x",
      intv: 1,
      bl: true,
      addr: myAddress(),
      slice: emptyCell().asSlice(),
      cell: emptyCell()
    };
  }
}