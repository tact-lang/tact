struct OptInner {
  flag: Bool?;
}

struct Combined {
  intVal: Int;
  boolVal: Bool;
  optInt: Int?;
  optBool: Bool?;
  optStruct: OptInner?;
}

contract TestContract {
  combined: Combined;

  init() {
    self.combined = Combined{
      intVal: 42,
      boolVal: false,
      optInt: null,
      optBool: true,
      optStruct: null
    };
  }
}
