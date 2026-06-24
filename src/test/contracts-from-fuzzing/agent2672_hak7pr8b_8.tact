struct Mix {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  cellVal: Cell;
  addressVal: Address;
  sliceVal: Slice;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract MixedFields {
  storage: Mix;

  init() {
    self.storage = Mix {
      intVal: 123,
      boolVal: true,
      stringVal: "hello",
      cellVal: emptyCell(),
      addressVal: myAddress(),
      sliceVal: emptyCell().asSlice(),
      optInt: null,
      optBool: false,
      optString: null
    };
  }
}