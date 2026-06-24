struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract TestContract {
  opt: OptionalStruct;
  init() {
    self.opt = OptionalStruct{foo: null, bar: true, baz: null};
  }
}