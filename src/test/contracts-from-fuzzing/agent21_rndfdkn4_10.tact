struct OptionalStruct {
  x: Int;
  y: Bool;
}

contract NullStructField {
  s: OptionalStruct?;

  init() {
    self.s = null;
  }
}
