contract OptionalPrimitive {
  a: Int?;
  b: Bool?;
  c: String?;

  init() {
    self.a = 5;
    self.b = null;
    self.c = "hi";
  }
}