contract OptionalWithDefaults {
  oi: Int?;
  b: Bool = true;

  init() {
    self.oi = null;
    self.b = false;
  }
}
