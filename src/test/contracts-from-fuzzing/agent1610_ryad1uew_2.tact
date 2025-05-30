struct OptionalStruct {
  a: Int?;
  b: Bool?;
}

contract TestOptionalFields {
  field: OptionalStruct;

  init() {
    self.field = OptionalStruct{
      a: null,
      b: null,
    };
  }
}