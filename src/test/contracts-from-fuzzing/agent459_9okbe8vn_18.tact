contract LotsOfFields {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Cell;
  h: Slice;
  i: Address;
  j: Address?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = false;
    self.d = null;
    self.e = "";
    self.f = null;
    self.g = emptyCell();
    self.h = emptyCell().asSlice();
    self.i = myAddress();
    self.j = null;
  }
}