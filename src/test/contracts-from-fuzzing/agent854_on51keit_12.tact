struct OptionalStructField {
  val: Int;
}

contract OptionalNestedStruct {
  s: OptionalStructField?;

  init() {
    self.s = null;
  }
}