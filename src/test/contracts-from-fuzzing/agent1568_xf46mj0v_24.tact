contract MixedDefaults {
  field1: Int = 0;
  field2: Bool;
  field3: String = "hi";

  init() {
    self.field2 = true;
  }
}