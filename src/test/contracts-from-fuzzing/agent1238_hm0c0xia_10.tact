contract ManyVars {
  a: Int;
  b: Int as uint8;
  c: Int as int16;
  d: Int as int64;
  e: Int as coins;
  f: Bool;
  g: Bool?;
  h: Int?;
  i: Address;
  j: Address?;
  k: Cell;
  l: Cell?;
  m: Slice;
  n: Slice?;
  o: String;
  init() {
    self.a = 1;
    self.b = 2;
    self.c = -1234;
    self.d = 123456;
    self.e = 789;
    self.f = true;
    self.g = null;
    self.h = null;
    self.i = myAddress();
    self.j = null;
    self.k = emptyCell();
    self.l = null;
    self.m = emptyCell().asSlice();
    self.n = null;
    self.o = "hi";
  }
}