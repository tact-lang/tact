contract OptionalInitedNulls {
  field1: Int? = null;
  field2: Bool? = null;
  field3: String? = null;

  init() {
    self.field1 = 5;
    self.field2 = true;
    self.field3 = "abc";
  }
}