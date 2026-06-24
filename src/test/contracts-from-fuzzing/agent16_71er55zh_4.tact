struct Opts {
  intVal: Int?;
  boolVal: Bool?;
  strVal: String?;
}

contract OptionalVars {
  data: Opts;

  init() {
    self.data = Opts{
      intVal: null,
      boolVal: null,
      strVal: null
    };
  }
}
