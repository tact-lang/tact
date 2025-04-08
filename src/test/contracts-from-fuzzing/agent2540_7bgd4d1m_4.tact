struct Mixed {
  n: Int;
  s: String;
  b: Bool;
  addr: Address;
  slice: Slice;
  cell: Cell;
}

contract MixedFields {
  data: Mixed;

  init() {
    self.data = Mixed{
      n: 1,
      s: "abc",
      b: true,
      addr: myAddress(),
      slice: emptyCell().asSlice(),
      cell: emptyCell()
    };
  }
}