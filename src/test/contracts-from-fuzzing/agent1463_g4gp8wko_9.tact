struct ManyOptionalFields {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract ManyOptsTest {
  s: ManyOptionalFields;

  init() {
    self.s = ManyOptionalFields{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
    };
  }
}
