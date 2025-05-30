struct Mix {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optAddr: Address?;
}

contract MixBag {
  m: Mix;

  init(addr: Address) {
    self.m = Mix{
      intVal: 42,
      boolVal: false,
      strVal: "ok",
      addrVal: addr,
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      optInt: null,
      optBool: null,
      optStr: null,
      optAddr: null
    };
  }
}