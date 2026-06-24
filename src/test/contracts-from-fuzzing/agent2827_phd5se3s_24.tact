contract OptionalMismatch {
  a: Int?;
  b: Bool = true;
  c: String;

  init() {
    self.a = null;
    self.c = "test";
  }
}