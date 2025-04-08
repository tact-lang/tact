contract MixOptDefaults {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Int? = null;
  e: String? = null;
  f: Bool? = null;
  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}