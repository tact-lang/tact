contract Test {
  a: Int;
  b: Int as uint64;
  c: Int as int8;
  d: Int as uint1;
  e: Int as int257;
  f: Bool;
  g: String;
  h: Address;
  i: Cell;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = -3;
    self.d = 1;
    self.e = 123456789000000000000000000000;
    self.f = true;
    self.g = "hi";
    self.h = myAddress();
    self.i = emptyCell();
  }
}