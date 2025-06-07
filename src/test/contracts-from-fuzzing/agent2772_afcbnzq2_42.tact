contract TrailingDefaults {
  a: Int = 1;
  b: Bool = true;
  s: String = "hi";

  init() {
    self.a=2;
    self.b=false;
    self.s="bye";
  }
}
