contract OutOfOrder {
  s: String;
  b: Bool;
  i: Int;

  init() {
    self.i = 1;
    self.b = true;
    self.s = "zzz";
  }
}
