contract NullableSerialized {
  a: Int? as coins;
  b: Int? as uint64;

  init() {
    self.a = null;
    self.b = null;
  }
}
