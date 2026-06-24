contract OptionalPartDefault {
  a: Int?;
  b: Bool = true;

  init() {
    self.a = null;
  }
}
