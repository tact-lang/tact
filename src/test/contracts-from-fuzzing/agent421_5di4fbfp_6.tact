struct OptionalFields { 
  a: Int?;
  b: Bool?;
  c: Address?;
}

contract OptTest {
  opt: OptionalFields;

  init() {
    self.opt = OptionalFields{ a: null, b: true, c: null };
  }
}