contract IntSerializationFail {
  tiny: Int as uint1;

  init() {
    self.tiny = 2;  // out of range, runtime error expected but should compile
  }
}