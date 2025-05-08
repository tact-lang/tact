struct OptStruct {
  foo: Int?;
  bar: Bool?;
}

contract OptionalStructField {
  s: OptStruct?;
  init() {
    self.s = null;
  }
}