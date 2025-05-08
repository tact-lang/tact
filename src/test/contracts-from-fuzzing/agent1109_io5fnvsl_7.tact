// Large number of persistent fields with all basic primitive types and optionals
contract LargeVariety {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: Cell?;
  k: Slice?;
  l: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = self.d.asSlice();
    self.f = "test";
    self.g = null;
    self.h = false;
    self.i = null;
    self.j = null;
    self.k = null;
    self.l = null;
  }
}