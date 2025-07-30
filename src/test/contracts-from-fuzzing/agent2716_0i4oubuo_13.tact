struct OptionalStruct {
  foo: Int;
}

contract OptStructField {
  bar: OptionalStruct?;

  init() {
    self.bar = null;
  }
}