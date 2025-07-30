struct MixTypes {
  intField: Int;
  boolField: Bool;
  strField: String;
  sliceField: Slice;
  cellField: Cell;
  addrField: Address;
}

contract MixedStruct {
  data: MixTypes;

  init() {
    self.data = MixTypes{
      intField:1,
      boolField:true,
      strField:"abc",
      sliceField: beginCell().endCell().asSlice(),
      cellField: beginCell().endCell(),
      addrField: myAddress(),
    };
  }
}