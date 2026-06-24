contract PrimitiveDefaults {
  intField: Int = 0;
  boolField: Bool = false;
  stringField: String = "hello";

  init() {
    self.intField = 1;
    self.boolField = true;
    self.stringField = "world";
  }
}