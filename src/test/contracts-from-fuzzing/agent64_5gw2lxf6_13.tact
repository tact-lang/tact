struct Varied {
  intField: Int;
  boolField: Bool;
  strField: String;
  cellField: Cell;
  sliceField: Slice;
  addrField: Address;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optCell: Cell?;
  optSlice: Slice?;
  optAddr: Address?;
}

contract TestContract {
  data: Varied;

  init() {
    self.data = Varied{
      intField: 1, boolField: true, strField: "hi", cellField: emptyCell(),
      sliceField: emptyCell().asSlice(), addrField: myAddress(),
      optInt: null, optBool: null, optStr: null, optCell: null, optSlice: null, optAddr: null
    };
  }
}