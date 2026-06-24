contract MultiDefaults {
  one: Int = 1;
  two: Int = 2;
  three: Int = 3;
  four: Int = 4;

  init() {
    self.one = 11;
    self.two = 22;
    self.three = 33;
    self.four = 44;
  }
}