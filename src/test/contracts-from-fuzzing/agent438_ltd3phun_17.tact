struct Mixed {
  intField: Int;
  boolField: Bool;
  stringField: String;
  addrField: Address;
  cellField: Cell;
  sliceField: Slice;
}

contract TestContract {
  data: Mixed;

  init() {
    self.data = Mixed{
      intField: 1,
      boolField: false,
      stringField: "hi",
      addrField: myAddress(),
      cellField: emptyCell(),
      sliceField: emptyCell().asSlice(),
    };
  }
}