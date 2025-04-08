contract ManyOptionals {
  a: Int?; b: Int?; c: Bool?; d: String?;
  e: Int?; f: Bool?; g: String?;

  init() {
    self.a = null;
    self.b = 2;
    self.c = true;
    self.d = null;
    self.e = 5;
    self.f = null;
    self.g = "abc";
  }
}