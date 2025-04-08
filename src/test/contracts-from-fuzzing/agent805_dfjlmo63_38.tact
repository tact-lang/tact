contract OptionalSerializeMix {
  a: Int? as uint4;
  b: Int? as int4;

  init() {
    self.a = null;
    self.b = null;
  }
}
