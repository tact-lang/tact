// Compose persistent storage only optional primitive fields
contract OptPrims {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
  }
}