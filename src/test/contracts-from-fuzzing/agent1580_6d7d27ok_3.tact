struct Complex {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  addrVal: Address;
  optStr: String?;
}

contract StructStorage {
  s: Complex;

  init() {
    self.s = Complex{
      intVal: 1,
      boolVal: false,
      strVal: "abc",
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell(),
      addrVal: myAddress(),
      optStr: null
    };
  }
}