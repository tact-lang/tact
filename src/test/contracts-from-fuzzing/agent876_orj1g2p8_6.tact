struct OptStruct {
  foo: Int?;
  bar: Bool;
}

contract OptionalStructField {
  a: Int;
  b: OptStruct?;

  init() {
    self.a = 5;
    self.b = null;
  }
}