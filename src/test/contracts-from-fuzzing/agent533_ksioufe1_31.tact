struct VariedNested {
  intField: Int;
  boolField: Bool;
  strField: String;
  addrField: Address;
  cellField: Cell;
  sliceField: Slice;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optAddr: Address?;
}

contract ComboNest {
  data: VariedNested;

  init() {
    self.data = VariedNested{
      intField: 1,
      boolField: true,
      strField: "s",
      addrField: myAddress(),
      cellField: emptyCell(),
      sliceField: emptyCell().asSlice(),
      optInt: null,
      optBool: null,
      optStr: null,
      optAddr: null
    };
  }
}