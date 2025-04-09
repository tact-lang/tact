struct UnusualOrder {
  str: String;
  intv: Int;
  boolv: Bool;
  addr: Address;
  optInt: Int?;
  sl: Slice;
  cellv: Cell;
  builder: Builder;
  optStr: String?;
}

contract WeirdOrderTest {
  obj: UnusualOrder;
  init() {
    self.obj = UnusualOrder{
      str: "hello",
      intv: 42,
      boolv: true,
      addr: myAddress(),
      optInt: null,
      sl: emptyCell().asSlice(),
      cellv: emptyCell(),
      builder: beginCell(),
      optStr: null,
    };
  }
}