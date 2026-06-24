struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllOptionalFields {
  os: OptionalStruct;

  init() {
    self.os = OptionalStruct{
      a: null,
      b: null,
      c: null
    };
  }
}