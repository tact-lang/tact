struct ManyOptionalFields {
  a: Int?;
  b: Address?;
  c: Cell?;
  d: Slice?;
  e: Bool?;
  f: String?;
  g: Int?;
  h: Bool?;
}

contract OptionalFieldsTest {
  data: ManyOptionalFields;

  init() {
    self.data = ManyOptionalFields{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
      h: null
    };
  }
}