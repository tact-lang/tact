// Mix persistent Int fields with explicit serialize format
contract SerializedInts {
  a: Int as uint8;
  b: Int as int16;
  c: Int as coins;
  d: Int;

  init() {
    self.a = 15;
    self.b = -1234;
    self.c = ton("1");
    self.d = 123456789;
  }
}