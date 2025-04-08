struct OptionalStruct {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract OptionalContract {
  field: OptionalStruct;

  init() {
    self.field = OptionalStruct{
      optInt: null,
      optBool: null,
      optStr: null
    };
  }
}