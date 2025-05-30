contract OptionalPrimitives {
  intOpt: Int?;
  boolOpt: Bool?;
  stringOpt: String?;

  init() {
    self.intOpt = 42;
    self.boolOpt = true;
    self.stringOpt = "hello";
  }
}