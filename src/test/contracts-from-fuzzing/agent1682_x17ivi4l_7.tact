struct OptionalInsideStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract TestContract {
  optField: OptionalInsideStruct?;

  init() {
    self.optField = null;
  }
}