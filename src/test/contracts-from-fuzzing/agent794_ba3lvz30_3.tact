struct ManyFields {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  addressVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
}

contract TestContract {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      intVal: 1,
      boolVal: true,
      stringVal: "hi",
      addressVal: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      builderVal: beginCell()
    };
  }
}
