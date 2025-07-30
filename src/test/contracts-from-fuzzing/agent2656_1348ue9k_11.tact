struct ManyTypes {
  intField: Int;
  boolField: Bool;
  strField: String;
  sliceField: Slice;
  cellField: Cell;
  builderField: Builder;
  addressField: Address;
}

contract VariousTypes {
  data: ManyTypes;

  init() {
    self.data = ManyTypes{
      intField:1,
      boolField:true,
      strField:"s",
      sliceField: emptyCell().asSlice(),
      cellField: emptyCell(),
      builderField: beginCell(),
      addressField: myAddress()
    };
  }
}
