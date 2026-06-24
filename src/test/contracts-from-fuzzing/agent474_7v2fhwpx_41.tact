// Contract with many optional fields, left null
contract Nulls {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
  e: Cell?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
  }
}
