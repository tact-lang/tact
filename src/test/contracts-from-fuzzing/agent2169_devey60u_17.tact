struct OptionalStruct {
  a: Int;
}

contract NullableOptionalStruct {
  s: OptionalStruct?;

  init() {
    self.s = null;
  }
}