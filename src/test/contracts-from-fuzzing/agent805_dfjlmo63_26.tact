contract OptionalFieldsDefaults {
  a: Int?;
  b: Int? = null;
  c: Int?;

  init() {
    self.a = null;
    self.c = null;
  }
}
