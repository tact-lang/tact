struct ComplexType {
  intVal: Int;
  boolVal: Bool;
  addressVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  strVal: String;
  optionalInt: Int?;
  optionalBool: Bool?;
}

contract ComplexFields {
  field: ComplexType;

  init() {
    self.field = ComplexType{
      intVal: 42,
      boolVal: true,
      addressVal: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell(),
      strVal: "hello",
      optionalInt: null,
      optionalBool: true,
    };
  }
}