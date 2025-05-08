struct OptionalFields {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  data: OptionalFields;

  init() {
    self.data = OptionalFields{
      a: null,
      b: true,
      c: "hello"
    };
  }
}