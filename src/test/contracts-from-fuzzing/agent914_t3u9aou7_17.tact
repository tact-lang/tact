contract LargePersistence {
  a: Int as int64;
  b: Int as uint64;
  c: Int as int128;
  d: Int as uint128;
  e: Int as coins;
  f: Int as int256;
  g: Int;
  h: Address;
  i: String;
  j: Cell;
  k: Slice;

  init() {
    self.a = -100;
    self.b = 100;
    self.c = -200;
    self.d = 200;
    self.e = 300;
    self.f = -400;
    self.g = 400;
    self.h = myAddress();
    self.i = "test";
    self.j = emptyCell();
    self.k = emptyCell().asSlice();
  }
}