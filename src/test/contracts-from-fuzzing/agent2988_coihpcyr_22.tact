contract OnlyFields {
  a: Int;
  b: String;
  c: Bool;
  init() {
    self.a = 1;
    self.b = "x";
    self.c = false;
  }
}