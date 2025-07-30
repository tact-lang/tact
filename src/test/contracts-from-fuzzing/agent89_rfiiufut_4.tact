struct Mixed {
  intf: Int;
  boolf: Bool;
  addrf: Address;
  cellf: Cell;
  slice: Slice;
  builder: Builder;
  str: String;
}

contract MixedFields {
  data: Mixed;

  init() {
    self.data = Mixed {
      intf: 1,
      boolf: true,
      addrf: myAddress(),
      cellf: emptyCell(),
      slice: emptyCell().asSlice(),
      builder: beginCell(),
      str: "hello"
    };
  }
}
