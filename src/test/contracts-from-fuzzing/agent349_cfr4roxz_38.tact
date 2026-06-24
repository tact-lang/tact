// Contract with many persistent optional String fields
contract ManyOptStrings {
  a: String?;
  b: String?;
  c: String?;
  d: String?;
  e: String?;

  init() {
    self.a = "A";
    self.b = null;
    self.c = "C";
    self.d = null;
    self.e = "E";
  }
}