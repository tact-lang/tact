struct Mix {
  intVal: Int;
  boolVal: Bool;
  optStr: String?;
  optBool: Bool?;
  optInt: Int?;
  strVal: String;
}

contract TestContract {
  m: Mix;

  init() {
    self.m = Mix{
      intVal: -1,
      boolVal: true,
      optStr: null,
      optBool: false,
      optInt: 100,
      strVal: "mix"
    };
  }
}