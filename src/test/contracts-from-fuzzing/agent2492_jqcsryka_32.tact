contract OptionalOnlyInit {
  a: Int?;
  b: Bool?;

  init() {
    self.a = null;
    self.b = null;
  }
}