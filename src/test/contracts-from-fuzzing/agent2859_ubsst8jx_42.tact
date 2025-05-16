contract IntChoices {
  a: Int as uint16;
  b: Int as int64;
  c: Int as uint64;

  init() {
    self.a=1;self.b=-2;self.c=3;
  }
}