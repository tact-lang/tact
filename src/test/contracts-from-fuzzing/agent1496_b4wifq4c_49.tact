contract IntBounds {
  small: Int as int4;
  big: Int;

  init() {
    self.small = 7;
    self.big = 1000;
  }
}