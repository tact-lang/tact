contract TrailingCommas {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";

  init() {
    self.a = 3;
    self.b = false;
    self.c = "y";
  }
}