contract OverSizedInt {
  x: Int as int4;

  init() {
    self.x = 16;
  }
}