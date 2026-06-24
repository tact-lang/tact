struct Combo {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract ComboFields {
  combo: Combo;

  init() {
    self.combo = Combo{
      intVal: 1,
      boolVal: true,
      strVal: "hi",
      optInt: null,
      optBool: null,
      optStr: null,
    };
  }
}