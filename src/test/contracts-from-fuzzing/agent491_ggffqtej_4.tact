struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract OptionalFields {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{ foo: null, bar: null, baz: null };
  }
}
