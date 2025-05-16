struct OptionalFields {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Address?;
}

contract Test {
  data: OptionalFields;
  init() {
    self.data = OptionalFields{
      a: null,
      b: true,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}