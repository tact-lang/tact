struct OptionalStruct {
  foo: Int?;
}

contract NullInitTest {
  test: OptionalStruct;

  init() {
    self.test = OptionalStruct{foo: null};
  }

  receive() {
    self.test = OptionalStruct{foo: null};
  }
}