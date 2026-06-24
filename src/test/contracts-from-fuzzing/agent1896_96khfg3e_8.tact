contract OptionalPrimitives {
  intOpt: Int?;
  boolOpt: Bool?;
  stringOpt: String?;

  init() {
    self.intOpt = null;
    self.boolOpt = true;
    self.stringOpt = null;
  }
}