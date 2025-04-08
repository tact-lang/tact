contract OptionalFieldsInit {
  a: Int?;
  b: Bool?;
  c: Slice?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}
