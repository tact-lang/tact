contract DefaultValues {
  i: Int = 1;
  b: Bool = true;
  s: String = "default";

  init() {
    self.i = 42;
    self.b = false;
    self.s = "changed";
  }
}