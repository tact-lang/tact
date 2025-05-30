contract LargeOptionMix {
  a: Bool;
  b: Bool?;
  c: Int;
  d: Int?;
  e: String;
  f: String?;
  g: Cell;
  h: Cell?;
  i: Address;
  j: Address?;

  init() {
    self.a = true;
    self.b = null;
    self.c = 1;
    self.d = null;
    self.e = "x";
    self.f = null;
    self.g = emptyCell();
    self.h = null;
    self.i = myAddress();
    self.j = null;
  }
}