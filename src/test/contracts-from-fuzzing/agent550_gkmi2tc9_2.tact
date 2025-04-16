struct DiverseFields {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  addrVal: Address;
}

contract Test {
  diverse: DiverseFields;
  init() {
    self.diverse = DiverseFields{
      intVal: 1,
      boolVal: true,
      strVal: "ok",
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell(),
      addrVal: myAddress()
    };
  }
}