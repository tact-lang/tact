contract SerializeOpt {
  a: Int? as uint4;
  b: Int? as int8;

  init() {
    self.a = null;
    self.b = null;
  }
}