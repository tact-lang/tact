// Contract with several optional contract fields with nulls
contract OptionalFieldsNull {
  a: Int?;
  b: Bool?;
  c: Cell?;
  d: Slice?;
  e: Address?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
  }
}