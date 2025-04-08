struct OptionalNested {
  intVal: Int?;
  boolVal: Bool?;
  strVal: String?;
}

contract TestContract {
  nested: OptionalNested;

  init() {
    self.nested = OptionalNested{
      intVal: null,
      boolVal: null,
      strVal: null
    };
  }
}