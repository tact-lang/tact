struct OptionalStruct {
  foo: Int?;
  bar: String?;
  baz: Bool?;
}

contract TestContract {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      foo: null,
      bar: null,
      baz: true
    };
  }
}