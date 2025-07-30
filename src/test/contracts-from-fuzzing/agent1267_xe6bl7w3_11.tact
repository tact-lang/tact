struct Mix {
  i: Int;
  b: Bool;
  s: String;
  addr: Address;
  cell: Cell;
  sl: Slice;
  bl: Builder;
}

contract MixFields {
  data: Mix;

  init() {
    self.data = Mix{
      i: 1,
      b: true,
      s: "hi",
      addr: myAddress(),
      cell: emptyCell(),
      sl: emptyCell().asSlice(),
      bl: beginCell()
    };
  }
}
