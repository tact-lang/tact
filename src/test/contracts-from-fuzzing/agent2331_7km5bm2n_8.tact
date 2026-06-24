struct ManyTypes {
  intField: Int;
  boolField: Bool;
  stringField: String;
  addressField: Address;
  cellField: Cell;
  sliceField: Slice;
  builderField: Builder;
  optInt: Int?;
  optBool: Bool?;
}

contract Test {
  val: ManyTypes;
  init() {
    self.val = ManyTypes{
      intField: 1,
      boolField: true,
      stringField: "s",
      addressField: myAddress(),
      cellField: emptyCell(),
      sliceField: emptyCell().asSlice(),
      builderField: beginCell(),
      optInt: null,
      optBool: null
    };
  }
}