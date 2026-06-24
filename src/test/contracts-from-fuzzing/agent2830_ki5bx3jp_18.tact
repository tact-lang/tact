contract CrossTypes {
  field1: Int;
  field2: Int?;
  field3: Bool;
  field4: String?;
  field5: String;

  init() {
    self.field1 = 123;
    self.field2 = null;
    self.field3 = true;
    self.field4 = null;
    self.field5 = "hi";
  }
}