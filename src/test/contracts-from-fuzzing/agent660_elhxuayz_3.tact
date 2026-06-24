struct OptionalFields {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Address?;
}

contract OptionalFieldsTest {
  storage: OptionalFields;

  init() {
    self.storage = OptionalFields{
      a: null,
      b: 123,
      c: true,
      d: null,
    };
  }
}