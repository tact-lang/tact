contract ManyOptionalAddressStringBool {
  a: Address?;
  b: Address?;
  s1: String?;
  s2: String?;
  f1: Bool?;
  f2: Bool?;

  init() {
    self.a = null;
    self.b = null;
    self.s1 = "x";
    self.s2 = null;
    self.f1 = true;
    self.f2 = null;
  }
}