contract PartialDefaults {
  a: Int = 0;
  b: Bool;
  c: String = "X";

  init() {
    self.b = true;
  }
}
