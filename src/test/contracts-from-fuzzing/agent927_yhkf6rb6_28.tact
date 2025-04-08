contract NullDefaults {
  optA: Int?;
  optB: Bool?;

  init() {
    self.optA = null;
    self.optB = null;
  }
}