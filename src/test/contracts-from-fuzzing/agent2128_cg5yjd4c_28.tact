contract OptionalSerialization {
  int1: Int?;
  int2: Int? as int64;
  int3: Int? as uint32;

  init() {
    self.int1 = null;
    self.int2 = null;
    self.int3 = null;
  }
}