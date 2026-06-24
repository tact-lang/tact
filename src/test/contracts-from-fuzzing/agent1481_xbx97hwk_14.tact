contract LotsOfFields {
  a: Int;
  b: Bool;
  c: Address;
  d: Int?;
  e: Bool?;
  f: Address?;
  g: Cell;
  h: Slice;
  i: String;
  j: Int as uint32;

  init() {
    self.a = 1;
    self.b = false;
    self.c = myAddress();
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = emptyCell();
    self.h = emptyCell().asSlice();
    self.i = "test";
    self.j = 42;
  }
}