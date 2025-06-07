struct IntBoolStr {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
}

contract PrimitiveStruct {
  data: IntBoolStr;

  init() {
    self.data = IntBoolStr{
      intVal: 5,
      boolVal: true,
      strVal: "hi"
    };
  }
}