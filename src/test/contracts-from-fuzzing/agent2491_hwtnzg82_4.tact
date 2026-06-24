struct OptStruct {
  foo: Int;
}

contract OptionalNested {
  bar: OptStruct?;

  init() {
    self.bar = OptStruct{foo: 42};
  }
}