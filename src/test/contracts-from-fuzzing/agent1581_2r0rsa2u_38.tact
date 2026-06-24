contract OptionalInits {
  a: Bool?;
  b: Int?;

  init() {
    self.a = null;
    self.b = null;
  }
}