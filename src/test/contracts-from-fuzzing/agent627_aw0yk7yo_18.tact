// contract w/ optional Int fields with explicit ascriptions
contract Test {
  a: Int? as int64;
  b: Int? as uint32;
  c: Int? as int257;

  init() {
    self.a = null;
    self.b = 123;
    self.c = -999;
  }
}