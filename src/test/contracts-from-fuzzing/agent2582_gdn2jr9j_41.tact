contract FieldDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "test";
  d: Int?;
  e: Bool?;
  f: String?;

  init() {
    self.d = null;
    self.e = null;
    self.f = null;
  }
}
