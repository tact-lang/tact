struct PrimMix {
  intVal: Int;
  boolVal: Bool;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  stringVal: String;
}

contract MixedPrimitives {
  data: PrimMix;

  init() {
    self.data = PrimMix{
      intVal: 42,
      boolVal: true,
      addrVal: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell(),
      stringVal: "hello"
    };
  }
}