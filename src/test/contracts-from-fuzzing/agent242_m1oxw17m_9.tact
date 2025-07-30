struct OptionalStruct {
  foo: Int;
}

contract OptionalFieldTest {
  s: OptionalStruct?;

  init() {
    self.s = OptionalStruct{
      foo: 42,
    };
  }
}