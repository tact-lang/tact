contract NoInitFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = "x";
  }
}