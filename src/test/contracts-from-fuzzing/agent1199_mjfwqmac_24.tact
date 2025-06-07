struct OptionalFields {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Int?;
  e: String?;
}

contract Test24 {
  of: OptionalFields;

  init() {
    self.of = OptionalFields{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null
    };
  }
}