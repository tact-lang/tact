struct BigVariants {
  iVal: Int;
  bVal: Bool;
  sliceVal: Slice;
  cellVal: Cell;
  addressVal: Address;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
  optSlice: Slice?;
  optCell: Cell?;
  optAddress: Address?;
  optStr: String?;
}

contract DiverseFields {
  content: BigVariants;

  init() {
    self.content = BigVariants{
      iVal: 1,
      bVal: false,
      sliceVal: emptyCell().asSlice(),
      cellVal: emptyCell(),
      addressVal: myAddress(),
      strVal: "hi",
      optInt: null,
      optBool: null,
      optSlice: null,
      optCell: null,
      optAddress: null,
      optStr: null
    };
  }
}
