// overload optional Int with specific bit sizes, to see nested serialization edge
contract OptSerdeSizes {
  a: Int? as uint4;
  b: Int? as uint8;
  c: Int? as int16;

  init() {
    self.a = 10; self.b = 20; self.c = 30;
  }
}
