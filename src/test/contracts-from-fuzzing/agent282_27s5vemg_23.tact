contract OptionalOverlap {
  i1: Int?; s1: String?; b1: Bool?;
  i2: Int; s2: String; b2: Bool;

  init() {
    self.i1 = null;
    self.s1 = null;
    self.b1 = null;
    self.i2 = 42;
    self.s2 = "yo";
    self.b2 = true;
  }
}