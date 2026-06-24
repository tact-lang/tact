contract OptionalStructs {
  s1: Int?;
  s2: Bool?;
  s3: Address?;
  s4: Cell?;
  s5: Slice?;
  s6: String?;

  init() {
    self.s1 = null;
    self.s2 = null;
    self.s3 = null;
    self.s4 = null;
    self.s5 = null;
    self.s6 = null;
  }
}