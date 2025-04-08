struct Combo {
  intVal: Int;
  boolVal: Bool;
  sliceVal: Slice;
  cellVal: Cell;
  addrVal: Address;
  strVal: String;
}

contract MixedTypesTest {
  state: Combo;

  init() {
    self.state = Combo{
      intVal: 123,
      boolVal: true,
      sliceVal: emptyCell().asSlice(),
      cellVal: emptyCell(),
      addrVal: myAddress(),
      strVal: "Hello"
    };
  }
}