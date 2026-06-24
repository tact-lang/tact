struct Varied {
  intVal: Int;
  boolVal: Bool;
  optInt: Int?;
  strVal: String;
  optBool: Bool?;
}

contract TestContract {
  variedData: Varied;

  init() {
    self.variedData = Varied{
      intVal: 42,
      boolVal: true,
      optInt: null,
      strVal: "string",
      optBool: false
    };
  }
}