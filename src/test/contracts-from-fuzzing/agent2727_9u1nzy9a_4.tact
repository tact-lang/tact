struct WeirdOrder {
  str: String;
  bl: Bool;
  int1: Int;
  addr: Address;
  int2: Int;
  cell1: Cell;
  sl: Slice;
  cell2: Cell;
  str2: String;
}

contract WeirdOrderContract {
  s: WeirdOrder;

  init() {
    self.s = WeirdOrder{
      str: "hi",
      bl: false,
      int1: 11,
      addr: myAddress(),
      int2: 22,
      cell1: emptyCell(),
      sl: emptyCell().asSlice(),
      cell2: emptyCell(),
      str2: "bye"
    };
  }
}