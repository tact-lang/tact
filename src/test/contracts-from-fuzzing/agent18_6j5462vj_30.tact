struct OptionalStruct {
  foo: Int?;
}

contract OptNestedDefault {
  bar: OptionalStruct? = null;

  init() {
    self.bar = OptionalStruct{ foo: null };
  }
}