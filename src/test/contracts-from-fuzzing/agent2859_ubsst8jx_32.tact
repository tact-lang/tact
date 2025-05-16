contract IntSerialization {
  big: Int as int257;
  tiny: Int as int4;

  init() {
    self.big = 123456789;
    self.tiny = 5;
  }
}