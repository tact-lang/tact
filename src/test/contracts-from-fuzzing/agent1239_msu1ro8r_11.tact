contract EmptyDefaults {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;

  init() {
    self.a = 0;
    self.b = null;
    self.c = false;
    self.d = null;
    self.e = "";
  }
}