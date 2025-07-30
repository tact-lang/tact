contract OptionalAndSerialized {
  a: Int? as uint8;
  b: Int? as int32;

  init() {
    self.a = null;
    self.b = null;
  }
}
