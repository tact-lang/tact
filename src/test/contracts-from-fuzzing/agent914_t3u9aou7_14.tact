contract SerializationEdge {
  signed8: Int as int8;
  unsigned4: Int as uint4;
  signed1: Int as int1;
  unsigned1: Int as uint1;

  init() {
    self.signed8 = -128;
    self.unsigned4 = 15;
    self.signed1 = -1;
    self.unsigned1 = 1;
  }
}