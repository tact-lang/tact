struct Combo {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
}

contract ComboTest {
  combo: Combo = Combo{
    intVal: 9,
    boolVal: false,
    strVal: "test",
    optInt: null,
    optBool: null,
  };

  init() {
    self.combo = Combo{
      intVal: 42,
      boolVal: true,
      strVal: "changed",
      optInt: 77,
      optBool: true,
    };
  }
}
