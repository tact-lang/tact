contract OptionalFieldsInitNulls {
  s: String?;
  a: Address?;
  b: Bool?;

  init() {
    self.s = null;
    self.a = null;
    self.b = null;
  }
}