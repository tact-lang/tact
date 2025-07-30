contract OptionalPrimInit {
  a: Int?;
  b: Bool? = null;

  init() {
    self.a = null;
  }
}
