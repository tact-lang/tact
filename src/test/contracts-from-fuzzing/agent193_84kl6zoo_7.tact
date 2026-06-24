contract LotsOfFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Cell;
  h: Slice;
  i: Address;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "test";
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = emptyCell();
    self.h = emptyCell().asSlice();
    self.i = myAddress();
  }
}