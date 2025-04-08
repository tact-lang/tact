struct ManyOptionalFields {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Bool?;
  e: String?;
  f: String?;
}

contract Test {
  st: ManyOptionalFields;
  init() {
    self.st = ManyOptionalFields{
      a: null,
      b: null,
      c: null,
      d: true,
      e: "Hello",
      f: null
    };
  }
}