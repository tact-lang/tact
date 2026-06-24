contract OptionalPrimitives {
  iv: Int?;
  bv: Bool?;
  sv: String?;

  init() {
    self.iv = null;
    self.bv = true;
    self.sv = null;
  }
}
