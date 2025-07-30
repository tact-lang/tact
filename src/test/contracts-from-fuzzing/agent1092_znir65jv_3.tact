struct OptionalFields {
  a: Int?;
  b: Bool?;
}

contract OptionalTest {
  data: OptionalFields;

  init() {
    self.data = OptionalFields{
      a: null,
      b: true
    };
  }
}
