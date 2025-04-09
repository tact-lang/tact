struct OptionalFields {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptTest {
  opts: OptionalFields;
  init() { self.opts = OptionalFields{}; }
}