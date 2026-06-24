struct Bundle {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  addressVal: Address;
}

contract FullFieldTypes {
  data: Bundle;

  init() {
    self.data = Bundle{
      intVal: 1,
      boolVal: true,
      stringVal: "ok",
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      addressVal: myAddress()
    };
  }
}
