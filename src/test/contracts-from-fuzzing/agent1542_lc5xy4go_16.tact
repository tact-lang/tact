contract OptionalFields {
  field1: Int?;
  field2: Bool?;
  field3: String?;
  field4: Address?;

  init() {
    self.field1 = null;
    self.field2 = null;
    self.field3 = null;
    self.field4 = null;
  }
}