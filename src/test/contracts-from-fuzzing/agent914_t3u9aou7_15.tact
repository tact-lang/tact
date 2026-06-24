contract OptionalSerialization {
  optUint4: Int? as uint4;
  optInt8: Int? as int8;

  init() {
    self.optUint4 = 15;
    self.optInt8 = -128;
  }
}