struct PrimitivesNoDefault {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  addrVal: Address;
}

contract Test {
  p: PrimitivesNoDefault;

  init() {
    self.p = PrimitivesNoDefault{
      intVal: 1,
      boolVal: false,
      strVal: "hi",
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell(),
      addrVal: myAddress()
    };
  }
}