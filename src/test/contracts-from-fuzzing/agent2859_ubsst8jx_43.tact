contract OptionalIntSizes {
  a: Int? as int32;
  b: Int? as uint8;
  c: Int?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}