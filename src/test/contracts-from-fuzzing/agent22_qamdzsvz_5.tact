struct ManyTypes {
  intField: Int;
  boolField: Bool;
  addressField: Address;
  cellField: Cell;
  stringField: String;
}

contract TestManyTypes {
  data: ManyTypes;

  init() {
    self.data = ManyTypes{
      intField: 1,
      boolField: true,
      addressField: myAddress(),
      cellField: emptyCell(),
      stringField: "hello"
    };
  }
}