struct OptionalStruct {
  foo: Int?;
}

contract OptionalStructField {
  val: OptionalStruct?;

  init() {
    self.val = null;
  }
}