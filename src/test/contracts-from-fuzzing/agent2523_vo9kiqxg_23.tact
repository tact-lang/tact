contract EmptyDefaults {
  i: Int;
  j: Int = 3;
  b: Bool;

  init() {
    self.i = 1;
    self.b = false;
  }
}
