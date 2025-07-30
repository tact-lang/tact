struct DifferentTypes {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
}

contract MultiTypeFields {
  data: DifferentTypes;

  init() {
    self.data = DifferentTypes{
      intVal: 100,
      boolVal: true,
      strVal: "abc"
    };
  }
}