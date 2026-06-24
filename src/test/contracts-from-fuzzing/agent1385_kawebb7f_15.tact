contract OptionDefaults {
  a: Int?;
  b: Int? = null;
  c: Bool? = null;

  init() {
    self.a = null;
  }
}