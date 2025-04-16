contract CorruptedSerde {
  a: Int? as uint8;
  b: Int? as uint8;
  c: Int? as uint8;
  init() {
    self.a = 300; self.b = -1; self.c = 1000;
  }
}