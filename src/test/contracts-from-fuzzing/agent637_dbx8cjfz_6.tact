struct MixIt {
  intVal: Int;
  boolVal: Bool;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  strVal: String;
}

contract TestContract {
  mixed: MixIt;

  init() {
    self.mixed = MixIt{
      intVal: 10,
      boolVal: false,
      addrVal: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      strVal: "hi"
    };
  }
}