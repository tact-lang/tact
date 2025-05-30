contract DeepOptionals {
  a: Int?;
  b: Bool?;
  c: String?;

  init() {
    self.a = 55;
    self.b = null;
    self.c = "ok";
  }
}