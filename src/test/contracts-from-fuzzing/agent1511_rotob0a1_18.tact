contract FieldsWithDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
  o: Int?;

  init() {
    self.o = null;
  }
}
