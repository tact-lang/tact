struct Composed {
  intVal: Int;
  optStr: String?;
  boolVal: Bool;
}

contract MixStruct {
  store: Composed;

  init() {
    self.store = Composed{
      intVal: 7,
      optStr: "yo",
      boolVal: true,
    };
  }
}
