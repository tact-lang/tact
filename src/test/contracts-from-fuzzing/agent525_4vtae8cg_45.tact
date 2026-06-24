contract SerializeOptional {
  a: Int? as uint32;
  b: Int? as int8;

  init() {
    self.a = 5;
    self.b = -7;
  }
}