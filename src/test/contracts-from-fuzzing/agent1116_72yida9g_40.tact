// optional inner struct with multiple optionals as fields
struct InnerFields {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalInternal {
  inner: InnerFields?;

  init() {
    self.inner = InnerFields{ a:1, b:null, c:"hi" };
  }
}