struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
}

contract NullPersistence {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      a: null,
      b: null,
      c: null,
      d: null
    };
  }
}
