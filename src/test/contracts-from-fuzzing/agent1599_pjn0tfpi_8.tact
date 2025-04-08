struct Various {
  intf: Int;
  boolf: Bool;
  strf: String;
  cf: Cell;
  sf: Slice;
  bf: Builder;
  addr: Address;
}

contract Test {
  data: Various;

  init() {
    self.data = Various{
      intf: 1,
      boolf: false,
      strf: "test",
      cf: emptyCell(),
      sf: emptyCell().asSlice(),
      bf: beginCell(),
      addr: myAddress(),
    };
  }
}