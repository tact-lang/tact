struct OptionalStructField {
  innerOpt: Int?;
}

contract NullableStruct {
  s: OptionalStructField?;

  init() {
    self.s = null;
  }
}