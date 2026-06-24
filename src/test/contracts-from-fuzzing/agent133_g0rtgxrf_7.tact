contract OnlyPrimitives {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  a: Address;
  oi: Int?;
  ob: Bool?;
  os: String?;
  oa: Address?;

  init() {
    self.i = 1;
    self.b = false;
    self.s = "str";
    self.c = emptyCell();
    self.sl = emptyCell().asSlice();
    self.a = myAddress();
    self.oi = null;
    self.ob = null;
    self.os = null;
    self.oa = null;
  }
}
