struct PrimitiveTypes {
  intVal: Int;
  boolVal: Bool;
  addressVal: Address;
  sliceVal: Slice;
  cellVal: Cell;
  stringVal: String;
}

contract AllPrimitives {
  p: PrimitiveTypes;

  init() {
    self.p = PrimitiveTypes{
      intVal: 1,
      boolVal: true,
      addressVal: myAddress(),
      sliceVal: emptySlice(),
      cellVal: emptyCell(),
      stringVal: "abc",
    };
  }
}