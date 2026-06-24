struct Compose {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract NestedOpt {
  nestedField: Compose?;

  init() {
    self.nestedField = null;
  }
}
